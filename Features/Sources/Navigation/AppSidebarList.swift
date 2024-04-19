//
//  AppSidebarList.swift
//
//
//  Created by Артём Клыч on 19.03.2024.
//

import SwiftUI
import NavigationAPI

struct AppSidebarList: View {
    @Binding var selection: AppScreen?
    
    var body: some View {
        List(AppScreen.allCases, selection: $selection) { screen in
            if #available(iOS 16.0, *) {
                NavigationLink(value: screen) {
                    screen.label
                }
            } else {
                NavigationLink(screen.title) {
                    screen.label
                }
            }
        }
        .navigationTitle(LocalizationManager.menu)
    }
}
