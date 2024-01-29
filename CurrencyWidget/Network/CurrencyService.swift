//
//  CurrencyService.swift
//  Currency
//
//  Created by Zaki on 09.01.2024.
//

import Foundation
import Combine

struct CurrencyService {
    static func getCurrencyData() -> AnyPublisher<[CurrencyData], Error> {
        let url = URL(string: "https://sdbo-ul-test.bankrbk.kz/api/exchange-rate/by-currency/?baseCurrencyIsoCode=KZT")!
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                
                return element.data
            }
            .decode(type: [CurrencyData].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
