//
//  LoginView.swift
//  Capitalpedia
//
//  Created by Thomas Korsnes on 26/10/2022.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    var body: some View {
        VStack(alignment: .center) {
            GoogleSignInButton()
                .onTapGesture {
                    viewModel.signIn()
                }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
