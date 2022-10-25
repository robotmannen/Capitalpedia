//
//  CountryCellView.swift
//  Capitalpedia
//
//  Created by Thomas Korsnes on 25/10/2022.
//

import SwiftUI

struct CountryCellView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    let countryData: Country
    
    var body: some View {
        HStack {
            Text(countryData.flag)
                .font(.system(size: 50))
            VStack(alignment: .leading) {
                Text(countryData.name.common)
                    .font(.headline)
                Text(countryData.name.official)
                    .font(.subheadline)
            }
            Spacer()
            ZStack {
                Text("🇺🇳")
                    .font(.largeTitle)
                Text(countryData.unMember ? "" : "🚫")
            }
            //  Make glow red/green depending on independence of country
            Divider()
        }
    }
}



struct CountryCellView_Previews: PreviewProvider {
    
    @EnvironmentObject var viewModel: ViewModel
    let countryData: Country
    
    static var previews: some View {
        CountryCellView(countryData: Country(name: Name(common: "Norway", official: "Kingdom of Norway"), independent: true, unMember: true, capital: ["Oslo"], languages: ["Norwegian": ""], region: "Europe", flag: "🇳🇴"))
    }
}
