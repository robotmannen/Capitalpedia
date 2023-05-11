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
    
    @State var sortingSelection: SortingType = .alphabetically
    
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
                        ToolbarItem(placement: .navigationBarTrailing) {
                            NavigationLink(destination: FavouritesView()) {
                                Text("Profile")
                            }
                        }
                        ToolbarItem(placement: .bottomBar) {
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
                Button(sortingSelection.rawValue, action: { viewModel.sortingSelection = sortingSelection })
            }
        }
    }
}

struct ListOfCountries: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        LazyVGrid(columns: [GridItem()]) {
            ForEach(viewModel.countriesSorted(), id: \.name) { countryData in
                NavigationLink(destination: CountryScreenView(countryData: countryData)) {
                    CountryCellView(countryData: countryData)
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
