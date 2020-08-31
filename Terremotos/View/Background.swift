//
//  Background.swift
//  Terremotos
//
//  Created by David on 2020-08-21.
//  Copyright © 2020 David. All rights reserved.
//

import SwiftUI

struct Background: View {
    var body: some View {
       Rectangle()
        .fill(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .top, endPoint: .bottom))
        .edgesIgnoringSafeArea(.all)
    }
}

struct Background_Previews: PreviewProvider {
    static var previews: some View {
        Background()
    }
}
