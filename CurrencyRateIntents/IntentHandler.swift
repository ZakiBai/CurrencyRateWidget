//
//  IntentHandler.swift
//  CurrencyRateIntents
//
//  Created by Zaki on 06.02.2024.
//

import Intents

class IntentHandler: INExtension, ConfigurationIntentHandling {
    
    func provideCustomCurrencyOptionsCollection(for intent: ConfigurationIntent, with completion: @escaping (INObjectCollection<CustomCurrency>?, Error?) -> Void) {
        let currencies: [CustomCurrency] = [
            CustomCurrency(identifier: "USD", display: "USD"),
            CustomCurrency(identifier: "GBP", display: "GBP"),
            CustomCurrency(identifier: "EUR", display: "EUR")
        ]
        
        let collection = INObjectCollection(items: currencies)
        
        completion(collection, nil)
    }
    
}
