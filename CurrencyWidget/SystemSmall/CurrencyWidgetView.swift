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
    var currencyType: CurrencyType // Define enum property
    
    init(entry: SimpleEntry, currencyType: CurrencyType) { // Pass enum value in the initializer
        self.entry = entry
        self.currencyType = currencyType
    }
    
    var body: some View {
        let currencyData = entry.currencyData
        switch family {
        case .systemSmall:
            switch currencyType {
            case .USD:
                let data = currencyData?[1]
                SmallWidgetView(entry: entry, currencyData: data)
                    .widgetBackground(Color.black)
            case .EUR:
                let data = currencyData?[2]
                SmallWidgetView(entry: entry, currencyData: data)
                    .widgetBackground(Color.black)
            case .GBP:
                let data = currencyData?[0]
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
    
    enum CurrencyType {
        case USD
        case EUR
        case GBP
    }
}



