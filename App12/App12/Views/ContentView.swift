//
//  ContentView.swift
//  App12
//
//  Created by Pedro Hamue on 07/07/20.
//  Copyright © 2020 Pedro Hamue. All rights reserved.
import SwiftUI

struct ContentView: View {
   // @State var showModalView = false
    @State var selectedStreaming: Streaming?
    var StreamName = ["Netflix","HBO GO","Disney +","Prime Video"]
    var StreamImage = ["netflix","hbo","disney","prime"]
   

    var body: some View {
        NavigationView{
            List(StreamingFactory.streamings){streaming in
                StreamingFullImageRow(Streaming:streaming)
                    .onTapGesture{
                       // self.showModalView = true
                        self.selectedStreaming = streaming
                }
                }
            .sheet(item: self.$selectedStreaming){ streaming in
                //isPresented: self.$showModalView){
                //if self.selectedStreaming != nil {
                    DetailView(Streaming:streaming) //self.selectedStreaming!)
            }
        .navigationBarTitle("Apps de Streaming",displayMode:.automatic)
        }
            }
            
}

            
     

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct StreamRow: View {
    var Streaming : Streaming
    var body: some View {
        HStack {
            Image(Streaming.image)
                .resizable()
                .aspectRatio(contentMode:.fit) .frame(width:150,height:150)
                .clipped()
                .cornerRadius(10)
            Text(Streaming.name)
        }
    }
}
struct StreamingFullImageRow : View {
    var Streaming: Streaming
    var body: some View{
    HStack{
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
}

