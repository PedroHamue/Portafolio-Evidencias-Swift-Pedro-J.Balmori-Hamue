//
//  ContentView.swift
//  8App
//
//  Created by Pedro Hamue on 27/06/20.
//  Copyright © 2020 Pedro Hamue. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var buttonColorChanged = false
    @State private var iconColorChanged = false
    @State private var iconSizeChanged = false
    var body: some View {
        ZStack{
            Circle()
                .frame(width:180,height:180)
                .foregroundColor(buttonColorChanged ?
                    Color(.systemGray4):.green)
              //.animation(.spring(response: 0.5, dampingFraction: 0.4, blendDuration: 0.5))
            Image(systemName: "keyboard")
                .font(.system(size:80))
                .foregroundColor(iconColorChanged ? .green: Color(.systemGray6))
                //.animation(.spring(response: 0.5, dampingFraction: 0.4, blendDuration: 0.5))
            .scaleEffect(iconSizeChanged ? 1.0:0.5)
            .animation(nil)
        }
        //.animation(.spring(response: 0.5, dampingFraction: 0.4, blendDuration: 0.5))
        .onTapGesture {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.4, blendDuration: 0.5)) {
            self.buttonColorChanged.toggle()
            self.iconColorChanged.toggle()
        
       }
            self.iconSizeChanged.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
