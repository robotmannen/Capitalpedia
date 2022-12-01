//
//  CountryCellView.swift
//  Capitalpedia
//
//  Created by Thomas Korsnes on 25/10/2022.
//

import SwiftUI
import FirebaseCrashlytics
import Mixpanel

struct CountryCellView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    let countryData: Country
    
    var body: some View {
        HStack {
            Text(countryData.flag)
                .font(.system(size: 50))
            VStack(alignment: .leading) {
                Text("\(countryData.name.common) - \(countryData.capital?.first ?? "No capital")")
                    .font(.headline)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                Text(countryData.name.official)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
                Text("pop: \(countryData.population)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
            coatOfArms
            //  Make glow red/green depending on independence of country
            Divider()
        }
    }
    var coatOfArms: some View {
        AsyncImage(url: URL(string: countryData.coatOfArms.png ?? "")) { resize in
            resize
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50, alignment: .center)
        } placeholder: {
            Image(systemName: "flag.slash")
                .font(.largeTitle)
                .frame(width: 50, height: 50, alignment: .center)
        }
    }
}



struct CountryCellView_Previews: PreviewProvider {
    
    @EnvironmentObject var viewModel: ViewModel
    
    let countryData: Country
    
    static var previews: some View {
        CountryCellView(countryData: Country(name: Name(common: "Norway", official: "Kingdom of Norway"), independent: true, unMember: true, capital: ["Oslo"], languages: ["Norwegian": ""], region: Region.europe, flag: "🇳🇴", population: 5500000, coatOfArms: CoatOfArms(png: "")))
    }
}
