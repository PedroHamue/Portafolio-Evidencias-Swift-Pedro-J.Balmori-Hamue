//
//  ContentView.swift
//  9APP
//
//  Created by Pedro Hamue on 29/06/20.
//  Copyright © 2020 Pedro Hamue. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showTranslation = false
    var body: some View {
        VStack{
            Rectangle()
                .frame(width:250,height:250)
                .foregroundColor(.orange)
            .overlay(
            Text("Car")
                .font(.system(.largeTitle,design:.rounded))
                .bold()
                .foregroundColor(.white)
            )
            if showTranslation{
            Rectangle()
                .frame(width:250,height:250)
                .foregroundColor(.purple)
            .overlay(
            Text("Carro")
                .font(.system(.largeTitle,design:.rounded))
                .bold()
                .foregroundColor(.white)
            )
                .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing))) //.transition(AnyTransition.offset(x:-700,y:0).combined(with: .scale).combined(with:.opacity))
                    //.scale(scale:0,anchor: .bottom))
                
            }
        }
        .onTapGesture {
            withAnimation(Animation.spring()){
            self.showTranslation.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
extension AnyTransition{
    static var offsetScaledOpacityOut: AnyTransition{
        AnyTransition.offset(x:-700,y:0)
            .combined(with:.scale)
            .combined(with:.opacity)
    }
}
