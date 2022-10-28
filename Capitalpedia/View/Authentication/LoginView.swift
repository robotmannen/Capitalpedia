//
//  LoginView.swift
//  Capitalpedia
//
//  Created by Thomas Korsnes on 26/10/2022.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack(alignment: .center) {
            
            Text("Capitalpedia")
                .font(.largeTitle)
            Text("login")
                .font(.subheadline)
            
            GoogleSignInButton()
                .onTapGesture {
                    viewModel.signIn()
                }
            TextField("email", text: $email)
            TextField("password", text: $password)
            Button(action: { viewModel.registerEmailUser(email: email, password: password) }, label: { Text("Register") })
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

