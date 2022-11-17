//
//  LoginView.swift
//  Capitalpedia
//
//  Created by Thomas Korsnes on 26/10/2022.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    @State private var presentAlert = false
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack(alignment: .center) {
            
            Text("Capitalpedia")
                .font(.largeTitle)
            Text("login")
                .font(.subheadline)
            
            VStack {
                GoogleSignInButton()
                    .padding()
                    .onTapGesture {
                        viewModel.signIn()
                    }
                emailLoginBtn
                Spacer()
            }
            .frame(width: 300, height: 300, alignment: .center)
            
        }
    }
    var emailLoginBtn: some View {
        Button("Login with email") {
            presentAlert = true
        }
        .alert("Login", isPresented: $presentAlert, actions: {
            TextField("Email", text: $email)
            SecureField("Password", text: $password)
            
            Button("Login", action: {})
            Button("Cancel", role: .cancel, action: {})
        }, message: {
            Text("Please enter your username and password.")
        })
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

