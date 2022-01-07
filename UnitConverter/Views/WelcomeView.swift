//
//  ContentView.swift
//  UnitConverter
//
//  Created by Dante Cesa on 1/5/22.
//

import SwiftUI

struct WelcomeView: View {
    var supportedConversions: [(String, AnyView)] = [
        ("Temperature", AnyView(TemperatureConversionView())),
        ("Length", AnyView(LengthConversionView())),
        ("Time", AnyView(TimeConversionView())),
        ("Volume", AnyView(VolumeConversionView()))]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    ForEach(0..<supportedConversions.count) { index in
                        let tuple = supportedConversions[index]
                        
                        NavigationLink(destination: tuple.1, label: { Text("\(tuple.0)")})
                    }
                }
            }.navigationTitle("UnitConverter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
