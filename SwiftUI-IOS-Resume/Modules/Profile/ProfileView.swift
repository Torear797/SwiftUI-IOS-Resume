//
//  ProfileView.swift
//  IOS-Resume
//
//  Created by Torear797 on 29.05.2023.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject private var viewModel = ProfileViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            mainView
                .navigationTitle("Account")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar { trailingToolbarItem }
        }
    }
    
    private var trailingToolbarItem: some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            Button("Done") { dismiss() }
        }
    }
    
    private var mainView: some View {
        List {
            Section {
                profileInfo
            }
            
            Section("Баланс") {
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
                .clipShape(Circle())
        }
    }
    
    private var userInfo: some View {
        VStack(alignment: .leading) {
            Text(viewModel.userFIO)
                .font(.system(size: 16))
                .foregroundColor(Color("Text"))
            
            Text(viewModel.userGitHub)
                .font(.system(size: 14))
                .foregroundColor(Color("Description"))
        }
    }
    
    private var stepper: some View {
        Stepper("\(viewModel.balance, specifier: "%.2f")",
                value: $viewModel.balance,
                step: 1000
        )
    }
    
}

#if DEBUG
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
#endif
