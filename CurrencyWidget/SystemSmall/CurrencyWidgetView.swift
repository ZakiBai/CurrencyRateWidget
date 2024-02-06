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
        switch family {
        case .systemSmall:
                if entry.showUSD {
                    let data = currencyData?[1]
                    SmallWidgetView(entry: entry, currencyData: data)
                        .widgetBackground(Color.black)
                } else if entry.showGBP {
                    let data = currencyData?[0]
                    SmallWidgetView(entry: entry, currencyData: data)
                        .widgetBackground(Color.black)
                } else if entry.showEUR {
                    let data = currencyData?[2]
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



