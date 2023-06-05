//
//  FilmItem.swift
//  IOS-Resume
//
//  Created by Torear797 on 15.01.2023.
//

import SwiftUI

struct FilmItem: View {
    
    @StateObject private var viewModel: FilmViewModel
    
    let animation: Namespace.ID
    
    init(film: Film, isFullScreen: Bool, animation: Namespace.ID) {
        let vm = FilmViewModel(film, isFullScreen: isFullScreen)
        _viewModel = StateObject(wrappedValue: vm)
        self.animation = animation
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            image
            info
        }
        .background {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(Color("CardBackground"))
        }
        .matchedGeometryEffect(
            id: viewModel.animationCardId,
            in: animation
        )
    }
    
    private var image: some View {
        GeometryReader { proxy in
            let size = proxy.size
            
            KingfisherImage(url: viewModel.film.preview)
                .frame(width: size.width, height: size.height)
                .clipShape(RoundedCorner(
                    radius: viewModel.isFullScreen ? 0 : 15,
                    corners: [.topLeft, .topRight]
                ))
                .contentShape(RoundedRectangle(cornerRadius: 15))
                .clipped()
        }
        .frame(height: 400)
    }
    
    private var rating: some View {
        HStack(spacing: 2) {
            Image("leftLeaf")
            
            Text(viewModel.film.rating)
                .fontWeight(.bold)
                .gradientForeground(colors: [Color("gold"), Color("dark-gold")])
            
            Image("rightLeaf")
        }
    }
    
    private var info: some View {
        HStack(spacing: 12) {
            VStack(alignment: .leading, spacing: 4) {
                Text(viewModel.film.nameRu)
                    .fontWeight(.bold)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color("Text"))
                
                Text(viewModel.info)
                    .font(.callout)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color("Description"))
            }
            
            Spacer()
            
            rating
        }
        .padding([.horizontal, .bottom])
    }
}
