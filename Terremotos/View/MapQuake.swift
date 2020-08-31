//
//  MapQuake.swift
//  Terremotos
//
//  Created by David on 2020-08-13.
//  Copyright © 2020 David. All rights reserved.
//

import SwiftUI
import UIKit
import MapKit


struct QuakeDetails: View {
    var data: Features
    var body: some View{
        ZStack(alignment: .top) {
            MapQuake(data: data)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center, spacing: 8){
                Text(String(data.properties.mag))
                    .font(.largeTitle)
                Text(data.properties.place)
                    .font(.subheadline)
                Text(timeConverter(timeStamp: data.properties.time))
                    .italic()
                    .font(.subheadline)
            }
            .clipShape(Rectangle())
            .frame(width: nil, height: nil)
            .padding(.all, 20)
            .background(Color.blue)
            .shadow(radius: 10)
            .cornerRadius(20)
            .opacity(0.5)
        }
    }
}

struct MapQuake: UIViewRepresentable {
    
    var data: Features
    
    func makeUIView(context: Context) -> MKMapView{
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
        let annotation = MKPointAnnotation()
        
        let coordinate = CLLocationCoordinate2D(latitude: data.geometry.coordinates[1], longitude: data.geometry.coordinates[0])
        let span = MKCoordinateSpan(latitudeDelta: 10.0, longitudeDelta: 10.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        
        uiView.setRegion(region, animated: true)
        annotation.coordinate = coordinate
        annotation.title = data.properties.place
        annotation.subtitle = "\(data.properties.mag)"
        uiView.addAnnotation(annotation)
        
    }
}




