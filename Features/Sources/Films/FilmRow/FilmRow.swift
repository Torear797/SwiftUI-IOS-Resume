//
//  FilmRow.swift
//
//
//  Created by Артём Клыч on 18.04.2024.
//

import DesignSystem
import FilmsAPI
import SwiftUI

struct FilmRow: View {
    let film: Film
    let animation: Namespace.ID
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            image
            info
        }
        .background(Color.cardBackground)
        .clipShape(.rect(cornerRadius: 20))
        .matchedGeometryEffect(
            id: "container\(film.id)",
            in: animation
        )
    }
    
    private var image: some View {
        GeometryReader { proxy in
            let size = proxy.size
            
            KingfisherImage(url: film.poster.preview)
                .frame(width: size.width, height: size.height)
                .clipShape(.rect)
        }
        .frame(height: 400)
    }
    
    private var rating: some View {
        HStack(spacing: 2) {
            Image("leftLeaf", bundle: .module)
            
            Text(film.rating)
                .fontWeight(.bold)
                .gradientForeground(colors: [Color.gold, Color.goldDark])
            
            Image("rightLeaf", bundle: .module)
        }
    }
    
    private var info: some View {
        HStack(spacing: 12) {
            VStack(alignment: .leading, spacing: 4) {
                Text(film.nameRu)
                    .fontWeight(.bold)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color.text)
                
                Text(film.info)
                    .font(.callout)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color.caption)
            }
            
            Spacer()
            
            rating
        }
        .padding([.horizontal, .bottom])
    }
}
