//
//  ComplexOutputView.swift
//  UnitConverter
//
//  Created by Dante Cesa on 1/6/22.
//

import SwiftUI

struct ComplexOutputView: View {
    let output: String
    var types: [String]
    @Binding var outputSelection: Int
    
    var body: some View {
        Section {
            Picker("", selection: $outputSelection) {
                ForEach(0..<types.count) { index in
                    Text(types[index])
                }
            }.pickerStyle(.segmented)
            Text(output)
        } header: {
            Text("Output")
        }
    }
}

struct ComplexOutputView_Previews: PreviewProvider {
    static var previews: some View {
        ComplexOutputView(output: "35", types: ["C", "F"], outputSelection: .constant(0))
    }
}
