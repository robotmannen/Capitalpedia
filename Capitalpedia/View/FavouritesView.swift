//
//  FavouritesView.swift
//  Capitalpedia
//
//  Created by Thomas Korsnes on 28/10/2022.
//

import SwiftUI

struct FavouritesView: View {
    
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    
    var body: some View {
        
        Button {
            authViewModel.signOut()
        } label: {
            Text("Logout")
        }
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView()
    }
}
