//
//  CapitalpediaApp.swift
//  Capitalpedia
//
//  Created by Thomas Korsnes on 24/10/2022.
//

import SwiftUI


import FirebaseCore
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}

@main
struct CapitalpediaApp: App {
    
    @StateObject var viewModel = AuthenticationViewModel()
    
    init() {
        setupAuthentication()
      }
    
    var body: some Scene {
        WindowGroup {
            LoginAuthView()
                .environmentObject(viewModel)
        }
    }
}

extension CapitalpediaApp {
  private func setupAuthentication() {
    FirebaseApp.configure()
  }
}
