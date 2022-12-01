//
//  AuthenticationViewModel.swift
//  Capitalpedia
//
//  Created by Thomas Korsnes on 26/10/2022.
//

import Foundation
import Firebase
import GoogleSignIn

class AuthenticationViewModel: ObservableObject {
    
    enum SignInState {
        case signedIn
        case signedOut
    }
    
    // 2
    @Published var state: SignInState = .signedOut
    @Published var loggedInUser: GIDProfileData?
    
    func signIn() {
        
        if GIDSignIn.sharedInstance.hasPreviousSignIn() {
            GIDSignIn.sharedInstance.restorePreviousSignIn { [unowned self] user, error in
                authenticateUser(for: user, with: error)
                loggedInUser = user?.profile
                
            }
        } else {
            guard let clientID = FirebaseApp.app()?.options.clientID else { return }
            
            let configuration = GIDConfiguration(clientID: clientID)
            
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
            guard let rootViewController = windowScene.windows.first?.rootViewController else { return }
            
            GIDSignIn.sharedInstance.signIn(with: configuration, presenting: rootViewController) { [unowned self] user, error in
                authenticateUser(for: user, with: error)
                loggedInUser = user?.profile
                
                
            }
        }
        
    }
    
    func signOut() {
        
        GIDSignIn.sharedInstance.signOut()
        
        do {
            
            try Auth.auth().signOut()
            
            state = .signedOut
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    private func authenticateUser(for user: GIDGoogleUser?, with error: Error?) {
        
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        
        guard let authentication = user?.authentication, let idToken = authentication.idToken else { return }
        
        let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)
        
        Auth.auth().signIn(with: credential) { [unowned self] (_, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                self.state = .signedIn
            }
        }
    }
    
    func registerEmailUser(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authdResult, error in
            print(authdResult?.user.displayName as Any)
            
        }
    }
}



