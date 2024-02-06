//
//  TimelineEntry.swift
//  CurrencyWidgetExtension
//
//  Created by Zaki on 09.01.2024.
//

import WidgetKit

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    let currencyData: [CurrencyData]?
}
