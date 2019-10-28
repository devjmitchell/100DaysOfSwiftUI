//
//  ContentView.swift
//  TempConverter
//
//  Created by Jason Mitchell on 10/27/19.
//  Copyright © 2019 Jason Mitchell. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var originalTemp = ""
    @State private var originalUnit = 0
    @State private var convertedUnit = 0
    
    let units = ["Celcius", "Fahrenheit", "Kelvin"]
    
    var convertedTemp: Double {
        let originalInput = Double(originalTemp) ?? 0
        
        let tempBeforeConvert: Measurement<UnitTemperature>
        let tempAfterConvert: Measurement<UnitTemperature>
        
        switch originalUnit {
        case 0:
            tempBeforeConvert = Measurement(value: originalInput, unit: .celsius)
        case 1:
            tempBeforeConvert = Measurement(value: originalInput, unit: .fahrenheit)
        default:
            tempBeforeConvert = Measurement(value: originalInput, unit: .kelvin)
        }
        
        switch convertedUnit {
        case 0:
            tempAfterConvert = tempBeforeConvert.converted(to: .celsius)
        case 1:
            tempAfterConvert = tempBeforeConvert.converted(to: .fahrenheit)
        default:
            tempAfterConvert = tempBeforeConvert.converted(to: .kelvin)
        }
        
        return tempAfterConvert.value
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Temperature", text: $originalTemp)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Convert from")) {
                    Picker("From", selection: $originalUnit) {
                        ForEach(0 ..< units.count) {
                            Text("\(self.units[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Convert to")) {
                    Picker("To", selection: $convertedUnit) {
                        ForEach(0 ..< units.count) {
                            Text("\(self.units[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Converted Temperature")) {
                    Text("\(convertedTemp, specifier: "%.1f")")
                }
            }
            .navigationBarTitle("Temp Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
