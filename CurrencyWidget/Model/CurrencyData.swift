//
//  CurrencyData.swift
//  Currency
//
//  Created by Zaki on 09.01.2024.
//

import Foundation

struct CurrencyData: Codable, Identifiable {
    var id: Int
    var type: ExchangeRateType?
    var typeId: Int?
    var baseCurrencyIsoCode: String?
    var targetCurrencyIsoCode: String?
    var validFrom: String?
    var validTo: String?
    var ratePurchase: String?
    var rateSale: String?
    var scale: String?
    var rateNational: String?
    
    struct ExchangeRateType: Codable {
        var value: String?
        var label: String?
    }
}
