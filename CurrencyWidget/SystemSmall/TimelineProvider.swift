//
//  TimelineProvider.swift
//  CurrencyWidgetExtension
//
//  Created by Zaki on 09.01.2024.
//
import Combine
import WidgetKit
import Intents

class CurrencyProvider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent(), currencyData: nil)
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        createTimelineEntry(date: Date(), configuration: configuration, completion: completion)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> ()) {
        createTimeline(date: Date(), configuration: configuration, completion: completion)
        print("Get updated")
    }
    
    var cancellables: Set<AnyCancellable> = []
    
    func createTimelineEntry(date: Date, configuration: ConfigurationIntent, completion: @escaping (SimpleEntry) -> ()) {
        CurrencyService
            .getCurrencyData()
            .sink { error in
                // Handle error, possibly by providing a default or fallback entry
                print("Error fetching currency data:", error)
            } receiveValue: { currencyData in
                let entry = SimpleEntry(date: date, configuration: configuration, currencyData: currencyData)
                completion(entry)
            }
            .store(in: &cancellables)
    }
    
    func createTimeline(date: Date, configuration: ConfigurationIntent, completion: @escaping (Timeline<SimpleEntry>) -> ()) {

        CurrencyService
            .getCurrencyData()
            .sink { error in
                // Handle error, possibly by providing a default or fallback entry
                print("Error fetching currency data:", error)
            } receiveValue: { currencyData in
                
                let entry = SimpleEntry(date: date, configuration: configuration, currencyData: currencyData)
                guard let nextUpdateDate = Calendar.current.date(byAdding: .minute, value: 5, to: date) else {
                    completion(Timeline(entries: [], policy: .never))
                    return
                }
                let timeline = Timeline(entries: [entry], policy: .after(nextUpdateDate))
                completion(timeline)
                
                print("createTimeline called at:", Date())
                print("Current Date:", date)
                print("Next Update Date:", nextUpdateDate)
                print("Currency data updated")
            }
            .store(in: &self.cancellables)
    }
    
}
