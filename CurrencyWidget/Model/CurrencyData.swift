//
//  CurrencyData.swift
//  Currency
//
//  Created by Zaki on 09.01.2024.
//

import Foundation

struct CurrencyData: Codable, Identifiable, Hashable {
    var id: Int
    var type: ExchangeRateType?
    var typeId: Int?
    var baseCurrencyIsoCode: String?
    var targetCurrencyIsoCode: String
    var validFrom: String?
    var validTo: String?
    var ratePurchase: String
    var rateSale: String
    var scale: String?
    var rateNational: String?
    
    struct ExchangeRateType: Codable {
        var value: String?
        var label: String?
    }
    
    // Implementing Hashable
        func hash(into hasher: inout Hasher) {
            // Combine the hash values of all properties that contribute to the object's identity
            hasher.combine(id) // Assuming `id` is a unique identifier for each instance
        }

        static func == (lhs: CurrencyData, rhs: CurrencyData) -> Bool {
            // Check whether two instances are equal
            return lhs.id == rhs.id // Assuming `id` is a unique identifier for each instance
        }
}
