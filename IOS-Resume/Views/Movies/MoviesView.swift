//
//  NewsView.swift
//  IOS-Resume
//
//  Created by Torear797 on 14.01.2023.
//

import SwiftUI

struct MoviesView: View {
    
    let animation: Namespace.ID
    
    @EnvironmentObject var filmDetailsViewModel: FilmDetailsViewModel
    
    @StateObject private var viewModel = MoviesViewModel()
    
    var body: some View {
        ScrollView {
            EmptyView().id(1)
            
            header
                .padding(.top)
            
            LazyVStack(spacing: 15) {
                ForEach(viewModel.films) { film in
                    createCardView(film: film)
                }
            }
            .padding(.bottom)
        }
        .background(Color("background"))
    }
    
    private var header: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading, spacing: 8) {
                Text("ТОП-250")
                    .font(.callout)
                    .foregroundColor(.gray)
                
                Text("Кинопоиск")
                    .font(.largeTitle.bold())
            }
            
            Spacer()
            
            Button {
                
            } label: {
                Image("kinopoiskLogo")
                    .resizable()
                    .frame(width: 50, height: 50)
            }
        }
        .padding(.horizontal)
        .padding(.bottom)
    }
    
    @ViewBuilder
    private func createCardView(film: Film) -> some View {
        Button {
            withAnimation(.interactiveSpring(
                response: 0.6,
                dampingFraction: 0.7,
                blendDuration: 0.7
            )) {
                filmDetailsViewModel.selectedFilm = film
                filmDetailsViewModel.isShow = true
            }
        } label: {
            FilmItem(film: film, isFullScreen: false, animation: animation)
                .scaleEffect(
                    filmDetailsViewModel.selectedFilm?.id == film.id &&
                    filmDetailsViewModel.isShow ? 1 : 0.93
                )
        }
        .buttonStyle(ScaleButtonStyle())
        .opacity(
            filmDetailsViewModel.isShow
            ? (filmDetailsViewModel.selectedFilm?.id == film.id ? 1 : 0)
            : 1
        )
    }
}
