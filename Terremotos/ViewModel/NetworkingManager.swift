//
//  NetworkingManager.swift
//  Terremotos
//
//  Created by David on 2020-08-11.
//  Copyright © 2020 David. All rights reserved.
//

import Foundation

class NetworkingManager: ObservableObject {
    
    @Published var dataList = QuakeAPIList(features: [])
    
    init() {
        guard let url = URL(string: "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/significant_month.geojson") else {return}
        
        URLSession.shared.dataTask(with: url){ data, _, error in
            
            if error != nil {
                print("Error at 1\(String(describing: error?.localizedDescription))")
            }
            
            do{
                guard let data = data else { return}
                let dataList = try JSONDecoder().decode(QuakeAPIList.self, from: data)
                DispatchQueue.main.async {
                    self.dataList = dataList
                    //print(dataList.features)
                }
            } catch {
                print("Error at 2 \(error.localizedDescription)")
            }
        }.resume()
    }
}
