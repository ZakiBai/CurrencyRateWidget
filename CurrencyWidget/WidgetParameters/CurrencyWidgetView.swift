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
    var currencyType: CurrencyType 
    
    init(entry: SimpleEntry, currencyType: CurrencyType) {
        self.entry = entry
        self.currencyType = currencyType
    }
    
    var body: some View {
        let currencyData = entry.currencyData
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
            case .ALL:
                MediumWidgetView(entry: entry)
                    .widgetBackground(Color.black)
            }
    }
    
    enum CurrencyType {
        case USD
        case EUR
        case GBP
        case ALL
    }
}



