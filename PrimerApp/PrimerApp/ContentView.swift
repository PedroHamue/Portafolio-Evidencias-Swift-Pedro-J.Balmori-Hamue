//
//  ContentView.swift
//  PrimerApp
//
//  Created by Pedro Hamue on 16/06/20.
//  Copyright © 2020 Pedro Hamue. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("SwiftUI provides views, controls, and layout structures for declaring your app's user interface. The framework provides event handlers for delivering taps, gestures, and other types of input to your app, and tools to manage the flow of data from your app's models down to the views ")
            .fontWeight(.bold)
            .font(.custom("Palatino",size:28))
            .foregroundColor(.yellow)
            .multilineTextAlignment(.center)
            .lineLimit(nil)
            .truncationMode(.middle)
            .lineSpacing(10)
            .padding(30)
            .rotationEffect( .degrees( 0 ),anchor:UnitPoint(x:0,y:0))
            .rotation3DEffect(.degrees(50), axis: (x:1,y:0,z:0))
            .shadow(color: .black, radius: 1, x: 0, y: 4.5)
  
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
