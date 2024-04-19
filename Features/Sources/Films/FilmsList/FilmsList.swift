//
//  FilmsList.swift
//
//
//  Created by Артём Клыч on 18.04.2024.
//

import DesignSystem
import SwiftUI

public struct FilmsList: View {
    
    // MARK: Constants
    
    let animation: Namespace.ID
    
    // MARK: StateObject
    
    @StateObject private var viewModel = ViewModel()
    
    // MARK: Init
    
    public init(animation: Namespace.ID) {
        self.animation = animation
    }
    
    // MARK: View
    
    public var body: some View {
        NavigationView {
            mainView
                .overlay(alignment: .top) { statusBarBackground }
        }
        .navigationViewStyle(.stack)
    }
    
    private var statusBarBackground: some View {
        Rectangle()
            .fill(.regularMaterial)
            .edgesIgnoringSafeArea(.top)
            .frame(height: 0)
    }
    
    private var mainView: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: .zero) {
                header
                list
            }
        }
        .background(Color.background)
    }
    
    private var header: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading, spacing: 8) {
                Text("ТОП-250")
                    .font(.callout)
                    .foregroundColor(.gray)
                
                Text("Кинопоиск")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            
            Spacer()
            
            Button {
                
            } label: {
                Image("kinopoiskLogo", bundle: .module)
                    .resizable()
                    .frame(width: 50, height: 50)
            }
        }
        .padding(.horizontal)
        .padding(.bottom)
    }
    
    private var list: some View {
        LazyVStack(spacing: 16) {
            ForEach(viewModel.films) { film in
                Button {
                    viewModel.didTap(film: film)
                } label: {
                    FilmRow(film: film, animation: animation)
                }
                .buttonStyle(.scaleButtonStyle)
            }
        }
        .padding(.horizontal, 16)
    }
}
