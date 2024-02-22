//
//  CurrencyWidgetBundle.swift
//  CurrencyWidget
//
//  Created by Zaki on 06.01.2024.
//

import WidgetKit
import SwiftUI

@main
struct CurrencyWidgetBundle: WidgetBundle {
    var body: some Widget {
        CurrencyWidgetUSD()
        CurrencyWidgetEUR()
        CurrencyWidgetGBP()
        CurrencyWidgetALL()
        CurrencyWidgetLiveActivity()
    }
}
