//
//  ProfileView.swift
//
//
//  Created by Артём Клыч on 19.04.2024.
//

import DesignSystem
import SwiftUI

struct ProfileView: View {
    
    // MARK: Environment
    
    @Environment(\.dismiss) private var dismiss
    
    // MARK: StateObject
    
    @StateObject private var viewModel = ViewModel()
    
    // MARK: View
    
    var body: some View {
        NavigationView {
            mainView
                .navigationTitle(LocalizationManager.account)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar { trailingToolbarItem }
        }
        .navigationViewStyle(.stack)
    }
    
    private var trailingToolbarItem: some ToolbarContent {
        ToolbarItem(placement: .primaryAction) {
            Button(LocalizationManager.done) { dismiss() }
        }
    }
    
    private var mainView: some View {
        List {
            Section {
                profileInfo
            }
            
            Section(LocalizationManager.balance) {
                stepper
            }
        }
    }
    
    private var profileInfo: some View {
        HStack(alignment: .top) {
            avatar
            userInfo
        }
    }
    
    @ViewBuilder
    private var avatar: some View {
        if let url = viewModel.user?.avatarURL {
            KingfisherImage(url: url, contentMode: .fit)
                .frame(width: 60, height: 60)
                .clipShape(.circle)
        }
    }
    
    private var userInfo: some View {
        VStack(alignment: .leading) {
            Text(viewModel.user?.fio ?? "")
                .font(.system(size: 16))
                .foregroundStyle(Color.text)
            
            Text(viewModel.user?.gitHub ?? "")
                .font(.system(size: 14))
                .foregroundStyle(Color.caption)
        }
    }
    
    private var stepper: some View {
        Stepper("\(viewModel.balance, specifier: "%.2f")",
                value: $viewModel.balance,
                step: 1000
        )
    }
}
