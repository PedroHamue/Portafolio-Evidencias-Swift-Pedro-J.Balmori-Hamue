//
//  ContentView.swift
//  6App
//
//  Created by Pedro Hamue on 25/06/20.
//  Copyright © 2020 Pedro Hamue. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var isPlaying=false
    var body: some View {
        Button(action:{
            self.isPlaying.toggle()
            print("Botón play pulsado")
        }){
            Image(systemName:isPlaying ? "stop.circle.fill":"play.circle.fill")
            .font(.system(size:100))
                .foregroundColor(isPlaying ? .red:.green)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
