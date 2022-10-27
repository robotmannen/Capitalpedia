//
//  DeciderView.swift
//  Capitalpedia
//
//  Created by Thomas Korsnes on 26/10/2022.
//

import SwiftUI

struct LoginAuthView: View {
    
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    var body: some View {
        switch viewModel.state {
        case .signedIn: ContentView()
        case .signedOut: LoginView()
        }
    }
}

