//
//  DetailView.swift
//  App12
//
//  Created by Pedro Hamue on 07/07/20.
//  Copyright © 2020 Pedro Hamue. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.presentationMode)var presentationMode
    @State private var showAlertView = false
    var Streaming: Streaming
    var body: some View {
        ScrollView{
            VStack{
                Image(Streaming.image)
                .resizable()
                    .aspectRatio(contentMode: .fit)
                Text(Streaming.name)
                    .font(.system(.title,design:.rounded))
                    .fontWeight(.black)
                    .multilineTextAlignment(.center)
                    .frame(width:300)
                .lineLimit(3)
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.top)
        .overlay(
        HStack{
            Spacer()
            VStack{
            Button(action:{
                self.showAlertView = true
            },label:{
                Image(systemName: "chevron.down.circle")
                    .font(.largeTitle)
                    .foregroundColor(.black)
            })
                .padding(.trailing,20)
                .padding(.top,20)
                Spacer()
    }
    }
    )
            .alert(isPresented: $showAlertView){
                Alert(title:Text("¿Seguro de Cerrar?"),message:Text("No lo haga compa"),primaryButton:.default(Text("simon,prro"),action:{self.presentationMode.wrappedValue.dismiss()}),secondaryButton:.cancel(Text("C Cancela prro")))
                
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(Streaming: Streaming(name: "Netflix",image:"netflix"))
    }
}

