//
//  cutieWidget.swift
//  cutieWidget
//
//  Created by Elif Bilge Parlak on 19.03.2023.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    @AppStorage("cutie",store: UserDefaults(suiteName: "group.com.elifbilgeparlak.CuteIconsProject"))
    var cutieData : Data = Data()
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent(), cutie: Cutie(image: "cat", name: "Cat", realName: "Any"))
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        
        if let cutie = try? JSONDecoder().decode(Cutie.self, from: cutieData){
            let entry = SimpleEntry(date: Date(), configuration: configuration, cutie: cutie)
            completion(entry)
            
        }
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        if let cutie = try? JSONDecoder().decode(Cutie.self, from: cutieData){
            let entry = SimpleEntry(date: Date(), configuration: configuration, cutie: cutie)
            let timeline = Timeline(entries: [entry], policy: .never)
            completion(timeline)
            
        }
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    //my code
    let cutie : Cutie
}

struct cutieWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        CircleImageView(image: Image(entry.cutie.image))
    }
}

@main
struct cutieWidget: Widget {
    let kind: String = "cutieWidget"

    var body: some WidgetConfiguration {
        
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            cutieWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Ctie Widget")
        .description("This is an example widget.")
    }
}

