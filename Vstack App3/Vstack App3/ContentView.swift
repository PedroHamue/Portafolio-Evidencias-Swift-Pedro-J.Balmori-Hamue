//
//  ContentView.swift
//  Vstack App3
//
//  Created by Pedro Hamue on 17/06/20.
//  Copyright © 2020 Pedro Hamue. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HeaderView()
            ZStack {
                PricingView(title: "Arkham World", subtitle:"Arkham Trilogy Guide" , price: "4.5 USD", textColor: .white, backgroundColor: .black,icon:"star")
                    
                  
                ZStack{
                    PricingView(title: "Dark Knight", subtitle:"More than Arkham Games" , price: "9 USD", textColor: .black, backgroundColor:Color(red:230/255,green:230/255,blue:230/255),icon:"timer")
                        .offset(x:0,y:155)
            
                    Text("All Arkham Games (including Arkham Origins and Arkham VR)and Injustice and LEGO Batman Guides here")
                        .font(.system(.caption,design:.rounded))
                            .foregroundColor(.white)
                            .fontWeight(.black)
                            .padding(1)
                        .background(Color(red:240/255,green:180/255,blue:50/255))
                        .offset(x:0,y:240)
                }
            }.padding(.horizontal)
            ZStack{
                PricingView(title: "Gotham Pack", subtitle:"All about Batman Games" , price: "20 USD", textColor: .white, backgroundColor: Color(red:50/255,green:50/255,blue:50/255),icon:"lightbulb").padding(.horizontal)
                Text("Become the hero that Gotham deserves")
                    .font(.system(.caption,design:.rounded))
                    .foregroundColor(.white)
                    .fontWeight(.black)
                .padding(8)
                    .background(Color(red:240/255,green:180/255,blue:50/255))
                    .offset(x:0,y:80)
               
            
            
                
            }.padding(.vertical)
                .offset(x:0,y:130)
        }.padding(.horizontal)
        
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HeaderView: View {
    var body: some View {
        HStack {
            VStack(alignment:.leading,spacing:4){
                Text("BATMAN:")
                    .font(.system(.largeTitle,design:.rounded))
                    .fontWeight(.heavy)
                Text("ARKHAM GUIDE")
                    .font(.system(.largeTitle,design:.rounded))
                    .fontWeight(.heavy)
                Text("All Arkham Games guides here!")
                    .font(.subheadline)
                    .fontWeight(.bold)
                
        
                
            }
           Spacer()
        }
    .padding()
    }
}

struct PricingView: View {
    var title: String
    var subtitle:String
    var price:String
    var textColor:Color
    var backgroundColor:Color
    var icon: String?
    
    var body: some View {
        VStack{
            icon.map({
                Image(systemName:$0)
                .font(.largeTitle)
                .foregroundColor(.white)
            })
            Text(title)
            .font(.system(.title,design:.rounded))            .fontWeight(.bold)
            .foregroundColor(textColor)
            Text(price)
                .font(.system(size:35,weight:.heavy,design:.rounded))
                .foregroundColor(textColor)
            Text(subtitle)
                .font(.headline)
                .foregroundColor(textColor)
          
            
    }.frame(minWidth:0,maxWidth:.infinity,minHeight:100)
        .padding(25)
        .background(backgroundColor)
        .cornerRadius(23)
        
        
    }
}

}
