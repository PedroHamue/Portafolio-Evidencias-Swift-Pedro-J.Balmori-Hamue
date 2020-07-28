//
//  ContentView.swift
//  10APP
//
//  Created by Pedro Hamue on 30/06/20.
//  Copyright © 2020 Pedro Hamue. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var StreamName = ["Netflix","HBO GO","Disney +","Prime Video"]
    var StreamImage = ["netflix","hbo","disney","prime"]
    var streamings = [
        Streaming(name:"Netflix",image:"netflix"),
        Streaming(name:"HBO GO",image:"hbo"),
        Streaming(name:"Disney +",image:"disney",feature:true),
          Streaming(name:"Amazon Prime Video",image:"prime")
    ]
    var body: some View {
        List(streamings.indices){idx in
            if self.streamings[idx].feature{
                StreamingFullImageRow(Streaming: self.streamings[idx])
            }else{
                StreamRow(Streaming:self.streamings[idx])
            }
        }
            }
            
        }

                
            //Text(Streaming.name)
                //.multilineTextAlignment(.center)
        
        
            //se puede eliminar el ForEach
            //ForEach(1...4,id: \.self){ //index in
               //Text("Fila \(/*index*/$0)")
            
           // Text("Fila 1")
            //Text("Fila 2")
            //Text("Fila 3")
            //Text("Fila 4")
     

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct Streaming: Identifiable{
    var id = UUID()
    var name: String
    var image:String
    var feature: Bool = false
}

struct StreamRow: View {
    var Streaming : Streaming
    var body: some View {
        HStack {
            Image(Streaming.image)
                .resizable()
                .aspectRatio(contentMode:.fill) .frame(width:100,height:100)
                .clipped()
                .cornerRadius(10)
            Text(Streaming.name)
        }
    }
}
struct StreamingFullImageRow : View {
    var Streaming: Streaming
    var body: some View{
    ZStack{
        Image(Streaming.image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height:200)
            .cornerRadius(15)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
            .foregroundColor(.gray)
                    .opacity(0.25)
        )
        Text(Streaming.name)
            .font(.system(.title,design:.rounded))
            .fontWeight(.bold)
            .foregroundColor(.white)
        
    }
    }
}
