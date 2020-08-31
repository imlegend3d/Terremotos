//
//  CellRow.swift
//  Terremotos
//
//  Created by David on 2020-08-11.
//  Copyright © 2020 David. All rights reserved.
//

import SwiftUI

struct CellRow: View {
    let data: Features
    var body: some View {
        HStack(alignment: .center, spacing: 10){
            VStack{
                Text(String(data.properties.mag))
                               .bold()
                               .foregroundColor(.yellow)
                               .font(.headline)
            }
            .frame(width: 100, height: 100)
            .background(Color.blue)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.gray, lineWidth: 2))
            .shadow(radius: 10)
            
            VStack(alignment: .leading, spacing: 10){
               // Text("Magnitud: \(String(format: "%.1f", (data.properties.mag)))")
                    //.font(.headline)
                Text(data.properties.place)
                    .font(.headline)
                Text(timeConverter(timeStamp: data.properties.time))
                .italic()
                    .font(.subheadline)
                    .padding(.top, 2)
            }
        }
    }
}
