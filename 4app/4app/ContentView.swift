//
//  ContentView.swift
//  4app
//
//  Created by Pedro Hamue on 20/06/20.
//  Copyright © 2020 Pedro Hamue. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Image("udemy")
                .resizable()
                .aspectRatio(contentMode:.fit)
                //.padding(90)
                .frame(height:50)
            Text("Pedro José Balmori Hamue")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            Text("Practicante de Ingeniería de la Universidad Mondragón México")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(.secondary)
            Text("4 cursos")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.secondary)
            Text("VIDEOJUEGOS:")
                .font(.headline)
                .fontWeight(.bold)
        
        //si quitamos el horizontal se vuelve vertical
        ScrollView(.horizontal,showsIndicators: false){
            
            HStack{
            CardView(imageName: "IA", authorName: "Pedro José Balmori Hamue", courseTitle: "Diseño DE VIDEOJUEGOS Y APPS CON IA", originalPrice: "50 USD", discountPrice: "25 USD")
                .frame(width:300)
            CardView(imageName: "Fortnite", authorName: "Pedro José Balmori Hamue", courseTitle: "Diseño DE VIDEOJUEGOS Y APPS CON UNITY 4", originalPrice: "30 USD", discountPrice: "19 USD")
                 .frame(width:300)
           
        }
            Spacer()
        }
            VStack{
                Text("INDUSTRIA:")
                              .font(.headline)
                              .fontWeight(.bold)
            }
           ScrollView(.horizontal,showsIndicators: false){
                
                HStack{
               
                CardView(imageName: "Curva", authorName: "Pedro José Balmori Hamue", courseTitle: "Curso de MATLAB", originalPrice: "20 USD", discountPrice: "10 USD")
                     .frame(width:300)
                CardView(imageName: "Formal", authorName: "Pedro José Balmori Hamue", courseTitle: "HACKING ÉTICO PROFESIONAL", originalPrice: "40 USD", discountPrice: "30 USD")
                     .frame(width:300) //tamaño de las ventanas
            }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
