//
//  ContentView.swift
//  Capitalpedia
//
//  Created by Thomas Korsnes on 24/10/2022.
//

import SwiftUI
import Mixpanel


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
                    .navigationTitle(APP_TITLE)
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
            ForEach(SortingType.allCases.reversed(), id: \.self) { sortingSelection in
                Button(action: { viewModel.sortingSelection = sortingSelection }, label: { Text(sortingSelection.rawValue) })
            }
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
