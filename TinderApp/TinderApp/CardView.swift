//
//  CardView.swift
//  TinderApp
//
//  Created by Pedro Hamue on 25/07/20.
//  Copyright © 2020 Pedro Hamue. All rights reserved.
//

import SwiftUI

struct CardView: View, Identifiable{
    let id = UUID()
    let escuderia: Escuderia
    
    
    var body: some View {
        ZStack{
            Color.black
            .cornerRadius(25)
                .edgesIgnoringSafeArea(.bottom)
        Image(escuderia.image)
        .resizable()
        .scaledToFit()
            .frame(minWidth: 0,maxWidth: .infinity)
        .cornerRadius(20)
            .padding(.horizontal,20)
            .overlay(
                VStack{
    
                    Text(escuderia.name)
                        .font(.system(.title,design: .rounded))
                        .fontWeight(.bold)
                        .padding(.horizontal,40)
                        .padding(.vertical,20)
                        .background(Color.white)
                    .cornerRadius(20)
                        .offset(x:0,y:120)
                    
                }//.padding(.top,15.5),alignment: .top
        )
        
        
    }
    }
}


struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(escuderia: escuderias[0])
    }
}
