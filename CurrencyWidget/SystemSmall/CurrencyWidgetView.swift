//
//  CurrencyWidgetView.swift
//  CurrencyWidgetExtension
//
//  Created by Zaki on 09.01.2024.
//

import SwiftUI
import WidgetKit

struct CurrencyWidgetEntryView: View {
    @Environment(\.widgetFamily) var family
    var entry: SimpleEntry
    
    var body: some View {
        let currencyData = entry.currencyData
        var identifier = entry.configuration.CustomCurrency?.identifier ?? ""
        
        switch family {
        case .systemSmall:
                if identifier == "USD" {
                    let data = currencyData?[1]
                    SmallWidgetView(entry: entry, currencyData: data)
                        .widgetBackground(Color.black)
                } else if identifier == "GBP" {
                    let data = currencyData?[0]
                    SmallWidgetView(entry: entry, currencyData: data)
                        .widgetBackground(Color.black)
                } else if identifier == "EUR" {
                    let data = currencyData?[2]
                    SmallWidgetView(entry: entry, currencyData: data)
                        .widgetBackground(Color.black)
                } else {
                    let data = currencyData?[1]
                    SmallWidgetView(entry: entry, currencyData: data)
                        .widgetBackground(Color.black)
                }
            
        case .systemMedium:
             MediumWidgetView(entry: entry)
                .widgetBackground(Color.black)
        default:
                Text("Not implemented")
               
        }
            
    }
}



