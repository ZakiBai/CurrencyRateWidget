//
//  SmallWidgetView.swift
//  CurrencyWidgetExtension
//
//  Created by Zaki on 09.01.2024.
//

import SwiftUI
import WidgetKit

struct SmallWidgetView: View {
    var entry: SimpleEntry
    var currencyData: CurrencyData?
    var body: some View {
        
        ZStack {
            ContainerRelativeShape()
                .fill(Color(red: 83/255, green: 104/255, blue: 114/255))
            
            VStack(spacing: 20) {
                HStack {
                    Image(currencyData?.targetCurrencyIsoCode ?? "")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 25, height: 25)
                        .clipShape(Circle())
                    Text(currencyData?.targetCurrencyIsoCode ?? "")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()
                }
                
                VStack(spacing: 15){
                    HStack {
                        Text("Продажа")
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                            .frame(width: 55, alignment: .leading)
                        
                        Spacer()
                        
                        Text((currencyData?.rateSale.dropLast(2) ?? "") + " ₸")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 80, alignment: .leading)
                    }
                    HStack {
                        Text("Покупка")
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                            .frame(width: 55, alignment: .leading)
                        
                        Spacer()
                        
                        Text((currencyData?.ratePurchase.dropLast(2) ?? "") + " ₸")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 80, alignment: .leading)
                    }
                }
                
                HStack {
                    Image("appLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 12, height: 12)
                        .cornerRadius(3)
                    Spacer()
                    Text(formattedDate)
                        .font(.system(size: 10))
                        .foregroundColor(.white.opacity(0.8))
                        .fontWeight(.semibold)
                }
            }
            .padding(8)
        }
    }

    private var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter.string(from: entry.date)
    }
}

struct SmallWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        SmallWidgetView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent(), currencyData: nil))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
            .widgetBackground(Color.clear)
    }
}

extension WidgetConfiguration {
    func contentMarginsDisabledIfAvailable() -> some WidgetConfiguration
        {
            if #available(iOSApplicationExtension 17.0, *)
            {
                return self.contentMarginsDisabled()
            }
            else
            {
                return self
            }
        }
}

extension View {
    func widgetBackground(_ backgroundView: some View) -> some View {
        if #available(iOSApplicationExtension 17.0, *) {
            return containerBackground(for: .widget) {
                backgroundView
            }
        } else {
            return background(backgroundView)
        }
    }
}
