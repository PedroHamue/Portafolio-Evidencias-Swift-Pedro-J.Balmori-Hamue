//
//  ContentView.swift
//  Tarea 10App
//
//  Created by Pedro Hamue on 02/07/20.
//  Copyright © 2020 Pedro Hamue. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var PilotName = ["Valtteri Bottas","Lewis Hamilton","Lando Norris","Carlos Sainz","Alexander Albon","Max Verstappen","Sebastian Vettel","Charles Leclerc","Daniel Ricciardo","Esteban Ocon","Lance Stroll","Sergio Pérez"]
    var PilotScudery=["Mercedes","mclaren","AstonMartin","ferrari","renault","racingpoint"]
  
    var Formula = [
        Pilot(name:"Valtteri Bottas",image:"Mercedes"),Pilot(name:"Lewis Hamilton", image:"Mercedes"),Pilot(name:"Lando Norris",image:"mclaren"),Pilot(name:"Carlos Sainz",image:"mclaren"),Pilot(name:"Alexander Albon",image:"AstonMartin"),Pilot(name:"Max Verstappen",image:"AstonMartin"),Pilot(name:"Sebastian Vettel",image:"ferrari"),Pilot(name:"Charles Leclerc",image:"ferrari"),Pilot(name:"Daniel Ricciardo",image:"renault"),Pilot(name:"Esteban Ocon",image:"renault"),Pilot(name:"Lance Stroll",image:"racingpoint"),Pilot(name:"Sergio Pérez",image:"racingpoint")]
    var body: some View {
        List(Formula.indices){idx in
            if self.Formula[idx].feature{
                PilotRow(Formula:self.Formula[idx])
            }else{
                PilotFullImageRow(Pilot:self.Formula[idx])
                
            }
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct Pilot: Identifiable{
    var id = UUID()
    var name: String
    var image: String
    var feature:Bool = false
    
}
struct PilotRow: View {
    var Formula : Pilot
    var body: some View{
        ZStack{
            Image(Formula.image)
            .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height:200)
            .cornerRadius(15)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.gray)
                    .opacity(0.25)
                
            )
            Text(Formula.name)
                .font(.system(.title,design:.rounded))
                .fontWeight(.bold)
                .foregroundColor(.white)
            
        }
    }
}
struct PilotFullImageRow : View {
    var Pilot: Pilot
    var body: some View{
    ZStack{
        Image(Pilot.image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height:100)
            .cornerRadius(15)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .padding(.horizontal)
            .foregroundColor(.gray)
                    .opacity(0.25)
        )
        Text(Pilot.name)
            .font(.system(.title,design:.rounded))
            .fontWeight(.bold)
            .foregroundColor(.white)
        
    }
    }
}
