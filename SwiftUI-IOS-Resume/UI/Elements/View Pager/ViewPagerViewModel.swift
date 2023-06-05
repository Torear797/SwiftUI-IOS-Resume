//
//  ViewPagerViewModel.swift
//  IOS-Resume
//
//  Created by Torear797 on 21.04.2023.
//

import SwiftUI

final class ViewPagerViewModel<Data, ID>: ObservableObject where Data : RandomAccessCollection, ID : Hashable {
    
    // MARK: - Published
    
    /// Текущий индекс элемента
    @Binding var selection: Int
    
    /// Offset по X
    @Published var dragOffsetX: CGFloat = .zero
    
    // MARK: - Constants
    
    /// Расстояние между элементами
    let spacing: CGFloat
    
    /// Ширина соседних видимых элементов
    let headspace: CGFloat
    
    /// Отступ крайних элементов
    let outside: CGFloat
    
    /// Данные для отображения
    let data: Data
    let dataId: KeyPath<Data.Element, ID>
    
    // MARK: - Variables
    
    /// Размер GeometryReader
    var viewSize: CGSize = .zero
    
    var itemWidth: CGFloat {
        var padding = defaultPadding * 2
        
        if selection == 0 || selection == data.count - 1 {
            padding = data.count == 1 ? outside * 2 :
            outside + defaultPadding
        }
        return max(0, viewSize.width - padding)
    }
    
    var itemActualWidth: CGFloat {
        itemWidth + spacing
    }
    
    var offset: CGFloat {
        let activeOffset = CGFloat(selection) * itemActualWidth
        var padding = defaultPadding
        if selection == 0 {
            padding = outside
        }
        return padding - activeOffset + dragOffsetX
    }
    
    private var defaultPadding: CGFloat {
        headspace + spacing
    }
    
    /// Анимация для смещения
    private(set) var offsetAnimation: Animation = .default
    
    init(
        _ data: Data,
        dataId: KeyPath<Data.Element, ID>,
        selection: Binding<Int>,
        spacing: CGFloat,
        headspace: CGFloat,
        outside: CGFloat
    ) {
        self.data = data
        self.dataId = dataId
        self._selection = selection
        self.spacing = spacing
        self.headspace = headspace
        self.outside = outside
    }
}

extension ViewPagerViewModel where ID == Data.Element.ID, Data.Element : Identifiable {
    
    convenience init(
        _ data: Data,
        selection: Binding<Int>,
        spacing: CGFloat,
        headspace: CGFloat,
        outside: CGFloat
    ) {
        self.init(
            data,
            dataId: \.id,
            selection: selection,
            spacing: spacing,
            headspace: headspace,
            outside: outside
        )
    }
}
