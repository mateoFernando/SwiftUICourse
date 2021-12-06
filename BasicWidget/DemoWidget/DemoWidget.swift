//
//  DemoWidget.swift
//  DemoWidget
//
//  Created by Fernando Daniel Mateo Ramos on 22/11/21.
//

import WidgetKit
import SwiftUI

struct WeatherProvider: TimelineProvider {
    func placeholder(in context: Context) -> WeatherEntry {
        WeatherEntry(date: Date(), degrees: 0, title: "", desc: "", icon: "thermometer.sun")
    }
    func getSnapshot(in context: Context, completion: @escaping (WeatherEntry) -> Void) {
        completion(WeatherEntry(date: Date(),degrees: 10,title: "Lluvia",desc: "Parece que va a llover",icon: "cloud.rain.fill"))
    }
    func getTimeline(in context: Context, completion: @escaping (Timeline<WeatherEntry>) -> Void) {
        var entries: [WeatherEntry] = []
        
        entries.append(WeatherEntry(date: Date(),degrees: 5,title: "Lluvia",desc: "Parece que va a nevar",icon: "cloud.snow"))
        entries.append(WeatherEntry(date: Date().addingTimeInterval(5),degrees: 20,title: "Lluvia",desc: "Parece que va a llover",icon: "cloud.bolt.rain"))
        entries.append(WeatherEntry(date: Date().addingTimeInterval(10),degrees: 35,title: "Lluvia",desc: "Parece que va a hacer sol",icon: "sun.max.fill"))
        completion(Timeline(entries: entries, policy: .atEnd))
    }
}

struct WeatherEntry: TimelineEntry {
    let date: Date
    let degrees: Int
    let title: String
    let desc: String
    let icon: String
}

struct DemoWidgetEntryView : View {
    var entry: WeatherProvider.Entry
    @Environment(\.widgetFamily) var family

    var body: some View {
        HStack{
            VStack{
                Image(systemName: entry.icon).resizable().frame(width: 60, height: 60)
                Text("\(entry.degrees)ºC").font(.title2)
                Text(entry.date, style:.time)
            }
            if family == .systemMedium {
                VStack{
                    Text(entry.title).font(.title).bold()
                    Text(entry.desc)
                }
            }
        }
    }
}

@main
struct DemoWidget: Widget {
    let kind: String = "DemoWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: WeatherProvider()) { entry in
            DemoWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

struct DemoWidget_Previews: PreviewProvider {
    static var previews: some View {
        DemoWidgetEntryView(entry: WeatherEntry(date: Date(),degrees: 10,title: "Lluvia",desc: "Parece que va a llover",icon: "cloud.rain.fill"))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
