//
//  ContentView.swift
//  UnitConverter
//
//  Created by Dante Cesa on 1/5/22.
//

import SwiftUI

struct WelcomeView: View {
    var supportedConversions: [(String, NavigationItem, AnyView)] = [
        ("Temperature", .temperature, AnyView(TemperatureConversionView())),
        ("Length", .length, AnyView(LengthConversionView())),
        ("Time", .time, AnyView(TimeConversionView())),
        ("Volume", .volume, AnyView(VolumeConversionView()))]
    @State var navigatedItem: NavigationItem?
    
    enum NavigationItem {
        case temperature
        case length
        case time
        case volume
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    ForEach(0..<supportedConversions.count) { index in
                        let tuple = supportedConversions[index]
                        
                        NavigationLink(tag: tuple.1,
                                       selection: $navigatedItem,
                                       destination: { tuple.2 },
                                       label: { Text("\(tuple.0)") }
                        )
                    }
                }
            }.navigationTitle("UnitConverter")
            TemperatureConversionView() // Sets temperature view as the secondary view for SplitView devices (i.e. iPad or landscape iPhones).
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
