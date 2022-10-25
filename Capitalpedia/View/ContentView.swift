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
                    // struct found in same file (ContentView) down below
                    ListOfCountries()
                }
                .navigationTitle("All Countries")
                .environmentObject(viewModel)
            }
        }
    }
}

struct ListOfCountries: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        LazyVGrid(columns: [GridItem()]) {
            if let listOfCountries = viewModel.countries {
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
