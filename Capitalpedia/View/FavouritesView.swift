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
        
        VStack {
            HStack {
                Text(authViewModel.loggedInUser?.name ?? "username not found")
                    .font(.largeTitle)
                    .bold()
                AsyncImage(url: authViewModel.loggedInUser?.imageURL(withDimension: UInt(100))) { resize in
                    resize
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50, alignment: .center)
                        .cornerRadius(50)
                } placeholder: {
                    Image(systemName: "flag.slash")
                        .font(.largeTitle)
                        .frame(width: 50, height: 50, alignment: .center)
                }
            }
            Spacer()
            Divider()
            Button {
                authViewModel.signOut()
            } label: {
                Text("Logout")
                    .foregroundColor(.red)
            }
            
        }
    }
    
    struct FavouritesView_Previews: PreviewProvider {
        static var previews: some View {
            FavouritesView()
        }
    }
}
