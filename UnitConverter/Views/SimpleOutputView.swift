//
//  OutputView.swift
//  UnitConverter
//
//  Created by Dante Cesa on 1/5/22.
//

import SwiftUI

struct SimpleOutputView: View {
    let output: String
    let withUnit: String
    
    var body: some View {
        Section {
            Text("\(output) \(withUnit)")
        } header: {
            Text("Output")
        }
    }
}

struct OutputView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleOutputView(output: "55", withUnit: "˚F")
    }
}
