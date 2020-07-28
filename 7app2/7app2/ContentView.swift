//
//  ContentView.swift
//  7app2
//
//  Created by Pedro Hamue on 27/06/20.
//  Copyright © 2020 Pedro Hamue. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
         ZStack{
                  Circle()
                    .trim(from: 0.0, to: 0.3)
                    .stroke(Color(.brown), lineWidth: 60)
                    
                    Circle()
                        .trim(from:0.30, to:0.5)
                        .stroke(Color(.systemPink), lineWidth: 60)
                    
                    Circle()
                        .trim(from:0.50, to:0.75)
                        .stroke(Color(.orange), lineWidth: 60)
                    
                    Circle()
                        .trim(from:0.75, to:1.00)
                        .stroke(Color(.red), lineWidth: 70)
                    .overlay(
                        Text("25%")
                            .font(.system(.title, design:.rounded))
                        .bold()
                        .foregroundColor(.white)
                        .offset(x:90, y:-90)
                    )
                    
                }
                .frame(width:250, height:250)
            }
        }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
