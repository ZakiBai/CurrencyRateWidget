//
//  CurrencyWidgetMediumView.swift
//  CurrencyWidgetExtension
//
//  Created by Zaki on 09.01.2024.
//

import SwiftUI
import WidgetKit

struct MediumWidgetView: View {
    var entry: SimpleEntry
    
    var body: some View {
        ZStack {
            ContainerRelativeShape()
                .fill(Color(red: 83/255, green: 104/255, blue: 114/255))
        }
    }
}

struct CurrencyWidgetMediumView_Previews: PreviewProvider {
    static var previews: some View {
        MediumWidgetView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent(), currencyData: nil))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}

