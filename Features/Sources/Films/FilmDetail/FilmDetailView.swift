//
//  FilmDetailView.swift
//
//
//  Created by Артём Клыч on 18.04.2024.
//

import DependencyInjection
import DesignSystem
import FilmsAPI
import SwiftUI

public struct FilmDetailView: View {
    
    // MARK: Constants
    
    private let film: Film
    private let animation: Namespace.ID
    private let coordinateSpace = "FilmDetailViewScrollView"
    
    // MARK: State
    
    @State private var isAnimateContent = false
    
    // MARK: DI
    
    @Inject private var filmViewer: FilmViewer
    
    // MARK: Init
    
    public init(film: Film, animation: Namespace.ID) {
        self.film = film
        self.animation = animation
    }
    
    // MARK: View
    
    public var body: some View {
        mainView
            .ignoresSafeArea(edges: .top)
            .overlay(alignment: .topTrailing) { closeButton }
            .background(Color.cardBackground)
            .onAppear() {
                withAnimation(
                    .interactiveSpring(
                        response: 0.6,
                        dampingFraction: 0.7,
                        blendDuration: 0.7
                    )
                ) {
                    isAnimateContent = true
                }
            }
    }
    
    private var mainView: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: .zero) {
                FilmRow(film: film, animation: animation)
                description
            }
        }
    }
    
    private var description: some View {
        Text(film.description)
            .font(.body)
            .foregroundStyle(Color.text)
            .lineSpacing(10)
            .padding(.horizontal, 16)
            .opacity(isAnimateContent ? 1 : 0)
            .scaleEffect(isAnimateContent ? 1 : 0, anchor: .top)
    }
    
    private var closeButton: some View {
        Button {
            filmViewer.dismiss()
        } label: {
            Image(systemName: "xmark.circle.fill")
                .font(.title)
                .foregroundColor(.white)
                .padding()
        }
    }
}
