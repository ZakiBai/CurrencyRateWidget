//
//  ContentView.swift
//  Currency
//
//  Created by Zaki on 06.01.2024.
//

import SwiftUI
import Combine

struct ContentView: View {
    @StateObject var viewModel = CurrencyViewModel()
    @State var data: [CurrencyData] = []
    
    var body: some View {
        
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            
            List {
                ForEach(data, id: \.id) { currencyData in
                    VStack {
                        Text(currencyData.ratePurchase)
                        Text(currencyData.rateSale)
                    }
                }
            }
            
            Text(data.first?.targetCurrencyIsoCode ?? "No iso code")
                .onReceive(viewModel.$currencyData) { newData in
                    self.data = newData
                }
            
            Button("FetchData") {
                print("Fetching")
                viewModel.fetchData { currencyData in
                    self.data = currencyData
                }
            }
        }
        .padding()
        
    }
        
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
