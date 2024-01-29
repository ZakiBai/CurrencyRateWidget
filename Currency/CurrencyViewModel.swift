//
//  CurrencyViewModel.swift
//  Currency
//
//  Created by Zaki on 09.01.2024.
//

import SwiftUI
import Combine

class CurrencyViewModel: ObservableObject {
   @Published var currencyData: [CurrencyData] = []
    var cancellables: Set<AnyCancellable> = []
    
    func fetchData(completion: @escaping ([CurrencyData]) -> Void) {
        CurrencyService
                .getCurrencyData()
                .sink { completion in
                    switch completion {
                    case .finished:
                        print("Data fetched")
                        break
                    case .failure(let error):
                        print("Error: \(error)")
                    }
                } receiveValue: { currencyData in
                    self.currencyData = currencyData
                    DispatchQueue.main.async {
                        completion(currencyData)
                    }
                }
                .store(in: &cancellables)
    }
}
