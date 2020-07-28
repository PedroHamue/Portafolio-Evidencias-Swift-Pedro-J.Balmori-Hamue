//
//  ContentView.swift
//  5App
//
//  Created by Pedro Hamue on 23/06/20.
//  Copyright © 2020 Pedro Hamue. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
        /*Button(action:{
            //que debe hacer el botón
            print("Botón Hola pulsado")
        }){
          //como debe verse
            Text("¡Hola Mundo!")
             
                   
            .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                .fontWeight(.black)
            .padding()
                .background(Color.green)
                 .foregroundColor(.white)
            .cornerRadius(50)
                //.border(Color.green,width:4)
            .padding(12)
                .overlay(RoundedRectangle(cornerRadius: 50).stroke(Color.green,lineWidth:5))
            }
            */
        
         Button(action:{
             print("Editar pulsado")
         }){
            HStack{
             Image(systemName:"square.and.pencil")
                Text("Editar")
                    .fontWeight(.bold)
            }
            }
         .buttonStyle(BasicButtonStyle())
            Button(action:{
                        print("compartir pulsado")
                    }){
                       HStack{
                        Image(systemName:"square.and.arrow.up")
                           Text("Compartir")
                               .fontWeight(.bold)
                       }
                       }
            .buttonStyle(BasicButtonStyle())
        Button(action:{
                    print("Botón con icono")
                }){
                   HStack{
                    Image(systemName:"trash")
                       Text("Eliminar")
                           .fontWeight(.bold)
            }
            }
        .buttonStyle(BasicButtonStyle())
        Button(action:{
                               print("Botón con icono")
                           }){
                              HStack{
                               Image(systemName:"folder")
                                  Text("Guardar")
                                      .fontWeight(.bold)
                                    
                       }
                       }   //.rotationEffect(.degrees(90))
                   .buttonStyle(BasicButtonStyle())
        }
    }
                   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct BasicButtonStyle:ButtonStyle{
                
func makeBody(configuration: Self.Configuration)->some View{ configuration.label
                    .frame(minWidth:0,maxWidth:.infinity)
                       .padding()
                    .background(LinearGradient(gradient:Gradient(colors:[Color("Dark Ocean"),Color("Dark Ocean 2")]),startPoint:.leading,endPoint:.trailing))
                       //.clipShape(Circle())
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    .cornerRadius(30)
                           .shadow(color:.blue,radius:10,x:10,y:5)
                           .padding(.horizontal,15)
    .scaleEffect(configuration.isPressed ? 0.8:1.0)
 
                }
}


