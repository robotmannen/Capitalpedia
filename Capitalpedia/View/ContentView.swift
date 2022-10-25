//
//  ContentView.swift
//  Capitalpedia
//
//  Created by Thomas Korsnes on 24/10/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    // Custom view found in same file (ContentView) down below
                    ListOfCountries()
                }
                .navigationTitle("All Countries")
                .toolbar {
                    sortMenu
                }
            }
        }
        .environmentObject(viewModel)
    }
    var sortMenu: some View {
        Menu("Filter") {
            Button(action: { viewModel.sortBy = .alphabetically }, label: { Text("Sort alphabetically")} )
            Button(action: { viewModel.sortBy = .reigionally }, label: { Text("Sort regionally")} )
            Button(action: { viewModel.sortBy = .all}, label: { Text("Show all")} )
        }
    }
}

struct ListOfCountries: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        LazyVGrid(columns: [GridItem()]) {
            if let listOfCountries = viewModel.sortCountries() {
                ForEach(listOfCountries, id: \.name) { countryData in
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
