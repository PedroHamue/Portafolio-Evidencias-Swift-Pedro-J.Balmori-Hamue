//
//  ContentView.swift
//  Images
//
//  Created by Pedro Hamue on 17/06/20.
//  Copyright © 2020 Pedro Hamue. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image("EmpireState")
            .resizable()
            .edgesIgnoringSafeArea(.vertical)
            //.scaledToFit()
            .aspectRatio(contentMode: .fill)
            .frame(width:300)
            //.clipped()
            .clipShape(Capsule())
        //Capsule,Circle,Ellipse
            .opacity(0.65)
            .overlay(
                Image(systemName:"heart.fill"))
            .font(.system(size:60))
            .foregroundColor(.red)
            .opacity(0.5)
            .overlay( Text("I LOVE NY")
          .fontWeight(.bold)
                .font(.title)
                .foregroundColor(.black)
                .padding()
                //.background(Color.gray)
                //.cornerRadius(10)
                .opacity(0.7)
                //.padding()
                /*Rectangle()
                .foregroundColor(.gray)
                .opacity(0.5)
                 .overlay(
                 Text("New York")
                 .font(.title)
                 .fontWeight(.bold)
                 .foregroundColor(.white)
                 .frame(width:250)*/
                
        )
        
    }
}
          
        
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
