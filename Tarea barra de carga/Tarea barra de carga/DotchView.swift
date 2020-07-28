//
//  DotchView.swift
//  Tarea barra de carga
//
//  Created by Pedro Hamue on 28/06/20.
//  Copyright © 2020 Pedro Hamue. All rights reserved.
//

import SwiftUI

struct DotchView: View {
    @State private var isLoading = false
    var body: some View {
        HStack{
            ForEach(0...5,id:\.self){index in
                Circle()
                    .frame(width:16, height: 16)
                    .foregroundColor(Color.green)
                    .scaleEffect(self.isLoading ? 0:1)
                    .animation(Animation.linear(duration:0.5).repeatForever().delay(Double(index)/6))
                
            }
            .onAppear(){
                self.isLoading = true
            }
        }
    }
}

struct DotchView_Previews: PreviewProvider {
    static var previews: some View {
        DotchView()
    }
}
