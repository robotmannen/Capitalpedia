//
//  ContentView.swift
//  Capitalpedia
//
//  Created by Thomas Korsnes on 24/10/2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    ScrollView {
                        VStack(alignment: .center) {
                            // Custom view found in same file (ContentView) down below
                            ListOfCountries()
                        }
                    }
                    .navigationTitle("Capitalpedia")
                    .toolbar {
                        ToolbarItemGroup(placement: .bottomBar) {
                            NavigationLink(destination: FavouritesView(), label: { Text("Profile") })
                                .environmentObject(authViewModel)
                            sortMenu
                        }
                    }
                    LoaderView()
                        .hidden(!viewModel.countries.isEmpty)
                }
            }
            .environmentObject(viewModel)
        }
    }
    
    
    var sortMenu: some View {
        Menu("Sort") {
            Button(action: { viewModel.sortBy = .alphabetically }, label: { Text("Sort all alphabetically") })
            Menu("Sort regionally") {
                Button(action: { viewModel.sortBy = .africa }, label: { Text("Africa") })
                Button(action: { viewModel.sortBy = .americas }, label: { Text("Americas") })
                Button(action: { viewModel.sortBy = .antarctic }, label: { Text("Antarctic") })
                Button(action: { viewModel.sortBy = .asia }, label: { Text("Asia") })
                Button(action: { viewModel.sortBy = .europe }, label: { Text("Europe") })
                Button(action: { viewModel.sortBy = .oceania }, label: { Text("Oceania") })
                
            }
            Button(action: { viewModel.sortBy = .populationSize }, label: { Text("Population") })
        }
    }
}

struct ListOfCountries: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        LazyVGrid(columns: [GridItem()]) {
            if let listOfCountries = viewModel.sortCountries() {
                ForEach(listOfCountries, id: \.name) { countryData in
                    NavigationLink(destination: CountryScreenView(countryData: countryData)) {
                        CountryCellView(countryData: countryData)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
