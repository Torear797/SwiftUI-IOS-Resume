//
//  ViewPager.swift
//  IOS-Resume
//
//  Created by Torear797 on 21.04.2023.
//

import SwiftUI

struct ViewPager<Data, ID, Content>: View where Data : RandomAccessCollection, ID : Hashable, Content : View {
    
    @ObservedObject private var viewModel: ViewPagerViewModel<Data, ID>
    
    @GestureState var dragOffsetX: CGFloat = .zero
    
    private let content: (Data.Element) -> Content

    var body: some View {
        GeometryReader { proxy -> AnyView in
            viewModel.viewSize = proxy.size
            return AnyView(generateContent(proxy: proxy))
        }
        .clipped()
    }
    
    private func generateContent(proxy: GeometryProxy) -> some View {
         HStack(spacing: viewModel.spacing) {
             ForEach(viewModel.data, id: viewModel.dataId) {
                 content($0)
                     .frame(width: viewModel.itemWidth)
             }
         }
         .frame(width: proxy.size.width, height: proxy.size.height, alignment: .leading)
         .offset(x: viewModel.offset)
         .highPriorityGesture(dragGesture)
         .onChange(of: dragOffsetX, perform: { newValue in
             viewModel.dragOffsetX = newValue
         })
         .animation(viewModel.offsetAnimation, value: viewModel.offset)
     }
}

// MARK: - Drag Gesture

extension ViewPager {
    
    var dragGesture: some Gesture {
        DragGesture()
            .updating($dragOffsetX, body: { value, state, transaction in
                var offset: CGFloat = viewModel.itemActualWidth
                if value.translation.width > 0 {
                    offset = min(offset, value.translation.width)
                } else {
                    offset = max(-offset, value.translation.width)
                }
                
                if viewModel.selection == 0, offset > 0 {
                    offset = 0
                }
                
                if viewModel.selection == viewModel.data.count - 1, offset < 0 {
                    offset = 0
                }
                
                state = offset
            })
            .onEnded(dragEnded)
    }
    
    private func dragEnded(_ value: DragGesture.Value) {
        let dragThreshold: CGFloat = viewModel.itemWidth / 4
        
        var activeIndex = viewModel.selection
        if value.translation.width > dragThreshold {
            activeIndex -= 1
        }
        if value.translation.width < -dragThreshold {
            activeIndex += 1
        }
        viewModel.selection = max(0, min(activeIndex, viewModel.data.count - 1))
    }
    
}

// MARK: - Initializers

extension ViewPager {
    
    /// Создание ViewPager на основе обычных данных
    /// - Parameters:
    ///   - data: Данные, используемые для создания view
    ///   - id: id для data
    ///   - selection: Индекс текущего элемента
    ///   - spacing: Расстояние между элементами
    ///   - headspace: Ширина видимой части соседних элементов от текущего
    ///   - content: View Builder - ваша view
    ///   - outside: Отступ у крайних элементов
    init(
        _ data: Data,
        id: KeyPath<Data.Element, ID>,
        selection: Binding<Int> = .constant(0),
        spacing: CGFloat = 0,
        headspace: CGFloat = 0,
        outside: CGFloat = 0,
        @ViewBuilder content: @escaping (Data.Element) -> Content
    ) {
        let vm = ViewPagerViewModel(
            data,
            dataId: id,
            selection: selection,
            spacing: spacing,
            headspace: headspace,
            outside: outside
        )
        viewModel = vm
        self.content = content
    }
}

extension ViewPager where ID == Data.Element.ID, Data.Element : Identifiable {
    
    /// Создание ViewPager на основе Identifiable данных
    /// - Parameters:
    ///   - data: Данные, используемые для создания view
    ///   - selection: Индекс текущего элемента
    ///   - spacing: Расстояние между элементами
    ///   - headspace: Ширина видимой части соседних элементов от текущего
    ///   - content: View Builder - ваша view
    ///   - outside: Отступ у крайних элементов
    init(
        _ data: Data,
        selection: Binding<Int> = .constant(0),
        spacing: CGFloat = 0,
        headspace: CGFloat = 0,
        outside: CGFloat = 0,
        @ViewBuilder content: @escaping (Data.Element) -> Content
    ) {
        
        let vm = ViewPagerViewModel(
            data,
            selection: selection,
            spacing: spacing,
            headspace: headspace,
            outside: outside
        )
        viewModel = vm
        self.content = content
    }
    
}
