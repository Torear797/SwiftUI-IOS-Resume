//
//  FilmDetails.swift
//  IOS-Resume
//
//  Created by Torear797 on 21.01.2023.
//

import SwiftUI

struct FilmDetails: View {
    
    @EnvironmentObject var viewModel: FilmDetailsViewModel
    
    let animation: Namespace.ID
    
    @State var scrollOffset: CGFloat = 0.0
    
    var body: some View {
        mainView
            .coordinateSpace(name: "scroll")
            .overlay(alignment: .topTrailing) {
                closeButton
                    .padding()
                    .opacity(viewModel.isAnimate ? 1 : 0)
            }
            .onAppear() {
                withAnimation(.interactiveSpring(
                    response: 0.6,
                    dampingFraction: 0.7,
                    blendDuration: 0.7
                )) {
                    viewModel.isAnimate = true
                }
                
                withAnimation(
                    .interactiveSpring(
                        response: 0.6,
                        dampingFraction: 0.7,
                        blendDuration: 0.7
                    )
                    .delay(0.1)
                ) {
                    viewModel.isAnimateContent = true
                }
            }
            .background(Color("CardBackground"))
            .transition(.identity)
            .statusBarHidden()
            .scaleEffect(viewModel.isAnimate ? 1 : 0.93)
            .edgesIgnoringSafeArea(.top)
    }
    
    @ViewBuilder
    private var mainView: some View {
        if let film = viewModel.selectedFilm {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    FilmItem(film: film, isFullScreen: true, animation: animation)
                        .scaleEffect(viewModel.isAnimate ? 1 : 0.93)
                    
                    VStack(spacing: 15) {
                        Text(viewModel.description)
                            .frame(maxWidth: .infinity)
                            .multilineTextAlignment(.leading)
                            .lineSpacing(10)
                            .padding(.bottom, 20)
                    }
                    .padding()
                    .offset(y: scrollOffset > 0 ? scrollOffset : 0)
                    .opacity(viewModel.isAnimateContent ? 1 : 0)
                    .scaleEffect(viewModel.isAnimateContent ? 1 : 0, anchor: .top)
                }
                .offset(y: scrollOffset > 0 ? -scrollOffset : 0)
                .offset(offset: $scrollOffset)
            }
        }
    }
    
    private var closeButton: some View {
        Button {
            withAnimation(.interactiveSpring(
                response: 0.6,
                dampingFraction: 0.7,
                blendDuration: 0.7
            )) {
                viewModel.isAnimate = false
                viewModel.isAnimateContent = false
            }
            
            withAnimation(
                .interactiveSpring(
                    response: 0.6,
                    dampingFraction: 0.7,
                    blendDuration: 0.7
                )
                .delay(0.05)
            ) {
                viewModel.close()
            }
        } label: {
            Image(systemName: "xmark.circle.fill")
                .font(.title)
                .foregroundColor(.white)
        }
    }
    
}
