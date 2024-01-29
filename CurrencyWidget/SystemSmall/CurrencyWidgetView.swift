//
//  CurrencyWidgetView.swift
//  CurrencyWidgetExtension
//
//  Created by Zaki on 09.01.2024.
//

import SwiftUI
import WidgetKit

struct CurrencyWidgetEntryView : View {
    var entry: SimpleEntry

    var body: some View {
        ZStack {
            ContainerRelativeShape()
                .fill(Color(red: 83/255, green: 104/255, blue: 114/255))
            
            VStack(spacing: 20) {
                HStack {
                    Image("iconUSA")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 25, height: 25)
                        .clipShape(Circle())
                    Text(entry.currencyData?[1].targetCurrencyIsoCode ?? "")
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
                        
                        Spacer()
                        
                        Text((entry.currencyData?[1].rateSale?.dropLast(2) ?? "") + " ₸")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    HStack {
                        Text("Покупка")
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Text((entry.currencyData?[1].ratePurchase?.dropLast(2) ?? "") + " ₸")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
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