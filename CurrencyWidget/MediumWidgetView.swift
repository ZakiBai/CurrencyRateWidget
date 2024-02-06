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
    var titles = ["Валюта", "Продажа", "Покупка"]
    var flags = ["GBP", "USD", "EUR"]
    
    var body: some View {
        let currencyData = entry.currencyData ?? []
        ZStack {
            ContainerRelativeShape()
                .fill(Color(red: 83/255, green: 104/255, blue: 114/255))

            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 65) {
                    ForEach(titles, id: \.self) { title in
                        Text(title)
                            .font(.system(size: 12))
                            .foregroundColor(.white.opacity(0.8))
                    }
                }

                ForEach(Array(currencyData.prefix(3).enumerated()), id: \.1.id) { (index, data) in

                        HStack(spacing: 60) {
                        HStack {
                            Image(flags[index % flags.count])
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 15, height: 15)
                            Text(data.targetCurrencyIsoCode )
                                .font(.system(size: 12))
                                .fontWeight(.bold)
                                .foregroundColor(.white)

                        }
                        .frame(width: 50, alignment: .leading)

                            Text((data.rateSale.dropLast(2) ) + " ₸")
                            .font(.system(size: 12))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 60, alignment: .leading)

                            Text((data.ratePurchase.dropLast(2) ) + " ₸")
                            .font(.system(size: 12))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 60, alignment: .leading)
                    }


                    if index < 2 {
                        Divider()
                            .background(Color.white)
                            .padding(.horizontal, 0)
                            .frame(height: 1)
                    }
                }
                Spacer()
                HStack {
                    Image("appLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 12, height: 12)
                        .cornerRadius(3)
                    Spacer()
                    Text("Курс на " + formattedDate)
                        .font(.system(size: 10))
                        .foregroundColor(.white.opacity(0.8))
                        .fontWeight(.semibold)
                }
            }
            .padding()
        }
    }
    private var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter.string(from: entry.date)
    }
        
}

struct CurrencyWidgetMediumView_Previews: PreviewProvider {
    static var previews: some View {
        MediumWidgetView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent(), currencyData: nil))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
            .widgetBackground(Color.clear)
            
    }
}
