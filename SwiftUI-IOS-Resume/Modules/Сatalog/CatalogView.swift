//
//  CatalogView.swift
//  IOS-Resume
//
//  Created by Torear797 on 15.01.2023.
//

import SwiftUI

struct CatalogView: View {
    
    @StateObject private var viewModel = CatalogViewModel()
    
    var body: some View {
        mainView
            .navigationTitle("Categories")
    }
    
    private var mainView: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                ForEach(viewModel.categories) { category in
                    NavigationLink {
                        CategoryDetailsView(viewModel: CategoryDetailsViewModel(
                            devices: category.items,
                            title: category.name
                        ))
                    } label: {
                        DeviceView(item: CatalogItem(
                            image: category.imageURL,
                            title: category.name,
                            description: category.description)
                        )
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 20)
        }
    }
}

#if DEBUG
struct CatalogView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView()
    }
}
#endif
