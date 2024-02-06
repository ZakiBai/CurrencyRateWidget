//
//  CurrencyWidget.swift
//  CurrencyWidget
//
//  Created by Zaki on 06.01.2024.
//

import WidgetKit
import SwiftUI
import Intents

struct CurrencyWidget: Widget {
    let kind: String = "CurrencyWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            CurrencyWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Currency")
        .description("Track currency exchange rates in real time")
        .supportedFamilies([.systemSmall, .systemMedium])
        .contentMarginsDisabledIfAvailable()
        .containerBackgroundRemovable(true)
        
    
        
    }
}

@available(iOSApplicationExtension 17.0, *)
struct CurrencyWidget_Previews: PreviewProvider {
    static var previews: some View {
        Group {
//            CurrencyWidgetEntryView(entry: SimpleEntry(date: Date(), showUSD: true, showGBP: true, showEUR: true, configuration: ConfigurationIntent(), currencyData: nil))
//                .previewContext(WidgetPreviewContext(family: .systemSmall))
//                .containerBackground(for: .widget) {
//                    Color.black
//                }
//
//            
//            CurrencyWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent(), currencyData: nil))
//                .previewContext(WidgetPreviewContext(family: .systemMedium))
//                .containerBackground(for: .widget) {
//                    Color.black
//                }
//                
        }
    }
}
