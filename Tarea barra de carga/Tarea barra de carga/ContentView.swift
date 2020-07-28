//
//  ContentView.swift
//  Tarea barra de carga
//
//  Created by Pedro Hamue on 28/06/20.
//  Copyright © 2020 Pedro Hamue. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoading = false
    @State private var progress: CGFloat = 0.0
    var body: some View {
            ZStack{
                VStack{
                Text("Cargando...")
                    .offset(x:0,y:50)
                }
                VStack{
                Text("\(Int(progress*100))%")
                    .font(.system(.title,design:.rounded))
                
                .bold()
                    .offset(x:0,y:100)
                }
                
                RoundedRectangle(cornerRadius:4)
                .stroke(Color(.systemGray6),lineWidth:5)
                .frame(width:300,height:4)
                RoundedRectangle(cornerRadius:4)
                .stroke(Color.green,lineWidth:5)
                    .frame(width:100,height:1.7)
                    .offset(x: isLoading ? 125:-125,y:0)
                    .animation(Animation.linear(duration:2).repeatForever(autoreverses: false))
                    .onAppear(){
                        self.isLoading = true
                        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true){ timer in
                            self.progress += 0.01
                            if self.progress >= 1.0{
                                timer.invalidate()
                            }

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
