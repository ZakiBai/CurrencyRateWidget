//
//  TimelineProvider.swift
//  CurrencyWidgetExtension
//
//  Created by Zaki on 09.01.2024.
//
import Combine
import WidgetKit
import Intents

class Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent(), currencyData: nil)
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        createTimelineEntry(date: Date(), configuration: configuration, completion: completion)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> ()) {
        createTimeline(date: Date(), configuration: configuration, completion: completion)
    }
    
    var cancellables: Set<AnyCancellable> = []
    
    func createTimelineEntry(date: Date, configuration: ConfigurationIntent, completion: @escaping (SimpleEntry) -> ()) {
        CurrencyService
            .getCurrencyData()
            .sink { _ in } receiveValue: { currencyData in
                let entry = SimpleEntry(date: date, configuration: configuration, currencyData: currencyData)
                completion(entry)
            }
            .store(in: &cancellables)
    }
    
    func createTimeline(date: Date, configuration: ConfigurationIntent, completion: @escaping (Timeline<SimpleEntry>) -> ()) {
        let currentDate = Date()
        let nextUpdateDate = Calendar.current.date(byAdding: .minute, value: 5, to: currentDate) ?? currentDate
        
        let timer = Timer.publish(every: 5 * 60, tolerance: 1, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                CurrencyService
                    .getCurrencyData()
                    .sink { _ in } receiveValue: { currencyData in
                        let entry = SimpleEntry(date: date, configuration: configuration, currencyData: currencyData)
                        let timeline = Timeline(entries: [entry], policy: .atEnd)
                        completion(timeline)
                    }
                    .store(in: &self.cancellables)
            }
        cancellables.insert(timer)
    }
}
