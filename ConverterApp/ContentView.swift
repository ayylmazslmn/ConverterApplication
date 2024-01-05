//
//  ContentView.swift
//  ConverterApp
//
//  Created by Süleyman Ayyılmaz on 5.01.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            FahrenheitToCelsiusView()
                .tabItem {
                    Label("F to C", systemImage: "thermometer.sun")
                }

            CelsiusToFahrenheitView()
                .tabItem {
                    Label("C to F", systemImage: "thermometer.snowflake")
                }

            KgToLbsView()
                .tabItem {
                    Label("kg to lbs", systemImage: "scalemass")
                }

            LbsToKgView()
                .tabItem {
                    Label("lbs to kg", systemImage: "scalemass")
                }

            CmToInchView()
                .tabItem {
                    Label("cm to inch", systemImage: "ruler")
                }

            InchToCmView()
                .tabItem {
                    Label("inch to cm", systemImage: "ruler")
                }

            KmToMileView()
                .tabItem {
                    Label("km to mile", systemImage: "figure.walk")
                }

            MileToKmView()
                .tabItem {
                    Label("mile to km", systemImage: "figure.walk")
                }
        }
        .accentColor(.orange)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct UnitConverterView: View {
    @Binding var inputValue: String
    let unitName: String
    let convert: (Double) -> String

    var body: some View {
        VStack {
            Spacer()

            TextField("", text: $inputValue)
                .keyboardType(.decimalPad)
                .font(Font.system(size: 64))
                .multilineTextAlignment(.center)

            Text("\(unitName) converter")
                .font(.title)
                .foregroundColor(.orange)

            Text("is actually ")
                .font(.title)
                .foregroundColor(.orange)


            Text("or")
                .font(.title)
                .foregroundColor(.orange)

            HStack {
                Spacer()
                Text("\(convert(Double(inputValue) ?? 0))")
                    .font(Font.system(size: 64))
                    .multilineTextAlignment(.center)
                Spacer()
            }

            Spacer()
        }
        .foregroundColor(.orange)
        .background(Color.white)
        .font(.title)
        .edgesIgnoringSafeArea(.all)
    }
}

struct FahrenheitToCelsiusView: View {
    @State private var fahrenheitValue: String = ""

    var body: some View {
        UnitConverterView(
            inputValue: $fahrenheitValue,
            unitName: "Fahrenheit",
            convert: { value in
                let fahrenheit = Measurement<UnitTemperature>(value: value, unit: .fahrenheit)
                let celsiusValue = fahrenheit.converted(to: .celsius).value
                return String(format: "%.2f", celsiusValue) + " °C"
            }
        )
    }
}

struct CelsiusToFahrenheitView: View {
    @State private var celsiusValue: String = ""

    var body: some View {
        UnitConverterView(
            inputValue: $celsiusValue,
            unitName: "Celsius",
            convert: { value in
                let celsius = Measurement<UnitTemperature>(value: value, unit: .celsius)
                let fahrenheitValue = celsius.converted(to: .fahrenheit).value
                return String(format: "%.2f", fahrenheitValue) + " °F"
            }
        )
    }
}

struct KgToLbsView: View {
    @State private var kgValue: String = ""

    var body: some View {
        UnitConverterView(
            inputValue: $kgValue,
            unitName: "kg",
            convert: { value in
                let kg = Measurement<UnitMass>(value: value, unit: .kilograms)
                let lbsValue = kg.converted(to: .pounds).value
                return String(format: "%.2f", lbsValue) + " lbs"
            }
        )
    }
}

struct LbsToKgView: View {
    @State private var lbsValue: String = ""

    var body: some View {
        UnitConverterView(
            inputValue: $lbsValue,
            unitName: "lbs",
            convert: { value in
                let lbs = Measurement<UnitMass>(value: value, unit: .pounds)
                let kgValue = lbs.converted(to: .kilograms).value
                return String(format: "%.2f", kgValue) + " kg"
            }
        )
    }
}

struct CmToInchView: View {
    @State private var cmValue: String = ""

    var body: some View {
        UnitConverterView(
            inputValue: $cmValue,
            unitName: "cm",
            convert: { value in
                let cm = Measurement<UnitLength>(value: value, unit: .centimeters)
                let inchValue = cm.converted(to: .inches).value
                return String(format: "%.2f", inchValue) + " inch"
            }
        )
    }
}

struct InchToCmView: View {
    @State private var inchValue: String = ""

    var body: some View {
        UnitConverterView(
            inputValue: $inchValue,
            unitName: "inch",
            convert: { value in
                let inch = Measurement<UnitLength>(value: value, unit: .inches)
                let cmValue = inch.converted(to: .centimeters).value
                return String(format: "%.2f", cmValue) + " cm"
            }
        )
    }
}

struct KmToMileView: View {
    @State private var kmValue: String = ""

    var body: some View {
        UnitConverterView(
            inputValue: $kmValue,
            unitName: "km",
            convert: { value in
                let km = Measurement<UnitLength>(value: value, unit: .kilometers)
                let mileValue = km.converted(to: .miles).value
                return String(format: "%.2f", mileValue) + " mile"
            }
        )
    }
}

struct MileToKmView: View {
    @State private var mileValue: String = ""

    var body: some View {
        UnitConverterView(
            inputValue: $mileValue,
            unitName: "mile",
            convert: { value in
                let mile = Measurement<UnitLength>(value: value, unit: .miles)
                let kmValue = mile.converted(to: .kilometers).value
                return String(format: "%.2f", kmValue) + " km"
            }
        )
    }
}
