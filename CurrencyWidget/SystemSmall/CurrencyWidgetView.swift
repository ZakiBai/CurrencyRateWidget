//
//  CurrencyWidgetView.swift
//  CurrencyWidgetExtension
//
//  Created by Zaki on 09.01.2024.
//

import SwiftUI
import WidgetKit

struct CurrencyWidgetEntryView : View {
    @Environment(\.widgetFamily) var family
    var entry: SimpleEntry

    var body: some View {
        switch family {
        case .systemSmall:
            SmallWidgetView(entry: entry)
                .widgetBackground(Color.black)
        case .systemMedium:
            MediumWidgetView(entry: entry)
                .widgetBackground(Color.black)
        default:
            Text("Not implemented")
        }
            
    }
}
