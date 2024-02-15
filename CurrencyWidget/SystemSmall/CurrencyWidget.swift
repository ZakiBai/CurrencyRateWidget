//
//  CurrencyWidget.swift
//  CurrencyWidget
//
//  Created by Zaki on 06.01.2024.
//

import WidgetKit
import SwiftUI
import Intents

struct CurrencyWidgetUSD: Widget {
    let kind: String = "CurrencyWidgetUSD"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider(), content: { entry in
            CurrencyWidgetEntryView(entry: entry, currencyType: .USD)
        })
        .configurationDisplayName("Currency")
        .description("Track USD currency exchange rates in real time")
        .supportedFamilies([.systemSmall])
        .contentMarginsDisabledIfAvailable()
        .containerBackgroundRemovable(true)
    }
}

struct CurrencyWidgetEUR: Widget {
    let kind: String = "CurrencyWidgetEUR"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider(), content: { entry in
            CurrencyWidgetEntryView(entry: entry, currencyType: .EUR)
        })
        .configurationDisplayName("Currency")
        .description("Track EUR currency exchange rates in real time")
        .supportedFamilies([.systemSmall])
        .contentMarginsDisabledIfAvailable()
        .containerBackgroundRemovable(true)
    }
}

struct CurrencyWidgetGBP: Widget {
    let kind: String = "CurrencyWidgetGBP"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider(), content: { entry in
            CurrencyWidgetEntryView(entry: entry, currencyType: .GBP)
        })
        .configurationDisplayName("Currency")
        .description("Track GBP currency exchange rates in real time")
        .supportedFamilies([.systemSmall, .systemMedium])
        .contentMarginsDisabledIfAvailable()
        .containerBackgroundRemovable(true)
    }
}



@available(iOSApplicationExtension 17.0, *)
struct CurrencyWidget_Previews: PreviewProvider {
    static var previews: some View {
        Group {
//            CurrencyWidgetEntryView(entry: SimpleEntry(date: Date(), currencyData: nil), currencyType: .EUR)
//                .previewContext(WidgetPreviewContext(family: .systemSmall))
//                .containerBackground(for: .widget) {
//                    Color.black
//                }

//            CurrencyWidgetEntryView(entry: SimpleEntry(date: Date(), currencyData: nil))
//                .previewContext(WidgetPreviewContext(family: .systemMedium))
//                .containerBackground(for: .widget) {
//                    Color.black
//                }
 
        }
    }
}
