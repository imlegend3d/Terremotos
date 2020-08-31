//
//  ContentView.swift
//  Terremotos
//
//  Created by David on 2020-08-11.
//  Copyright © 2020 David. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkingManager = NetworkingManager()
    
    var body: some View {
        ZStack{
            Background()
            NavigationView {
                List(networkingManager.dataList.features, id: \.properties) { data in
                    NavigationLink(destination: QuakeDetails(data: data)) {
                       CellRow(data: data)
                    }
                    .background(Color.purple)
                    .listRowBackground(Color.purple)
                }.navigationBarTitle("Terremotos", displayMode: .inline)
            }
        }
    }
}

func timeConverter(timeStamp: Double) -> String {
    let unixTimeStamp = timeStamp / 1000
    let date = Date(timeIntervalSince1970: unixTimeStamp)
    let dateFormatter = DateFormatter()
    dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
    
    dateFormatter.locale = NSLocale.current
    dateFormatter.dateFormat = "MMM dd YYYY, hh:mm a"
    return dateFormatter.string(from: date)
}

struct Destination: View {
    let data: Features
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            Text("Magnitud: \(String(format: "%.1f", (data.properties.mag)))")
                .font(.headline)
            Text(data.properties.place)
                .font(.subheadline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

