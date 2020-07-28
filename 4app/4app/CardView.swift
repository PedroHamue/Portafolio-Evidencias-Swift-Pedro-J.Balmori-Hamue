//
//  CardView.swift
//  4app
//
//  Created by Pedro Hamue on 20/06/20.
//  Copyright © 2020 Pedro Hamue. All rights reserved.
//

import SwiftUI

struct CardView: View {
    var imageName:String
    var authorName:String
    var courseTitle:String
    var originalPrice:String
    var discountPrice:String
    var body: some View {
        VStack{
        Image(imageName).resizable()
            .aspectRatio(contentMode:.fit)
            HStack {
                VStack(alignment:.leading){
                Text(authorName)
                    .font(.headline)
                    .foregroundColor(.secondary)
                Text(courseTitle.uppercased())
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .lineLimit(3)
                HStack{
                Text(discountPrice)
                    .font(.subheadline)
                    .foregroundColor(.primary)
                Text(originalPrice)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .strikethrough()
                }
                     
                }.layoutPriority(10)
                   Spacer()
            }.padding()
          
    }
    .cornerRadius(12)
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color(red:130/255,green:130/255,blue:130/255,opacity:0.2),lineWidth:10))
        .padding([.top,.horizontal])
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(imageName: "Fortnite", authorName: "Pedro José Balmori Hamue", courseTitle: "Diseño DE VIDEOJUEGOS Y APPS CON UNITY 4", originalPrice: "30 USD", discountPrice: "19 USD")
    }
}

}
