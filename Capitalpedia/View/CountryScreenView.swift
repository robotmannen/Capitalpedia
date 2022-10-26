//
//  SwiftUIView.swift
//  Capitalpedia
//
//  Created by Thomas Korsnes on 25/10/2022.
//

import SwiftUI

struct CountryScreenView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    let countryData: Country
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(countryData.name.common)
                    .bold()
                    .foregroundColor(.primary)
                    .font(.largeTitle)
                Spacer()
                Text(countryData.flag)
                    .font(.largeTitle)
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CountryScreenView(countryData: Country(name: Name(common: "Norway", official: "Kingdom of Norway"), independent: true, unMember: true, capital: ["Oslo"], languages: ["Norwegian": ""], region: Region.europe, flag: "🇳🇴", population: 5500000, coatOfArms: CoatOfArms(png: "")))
    }
}
