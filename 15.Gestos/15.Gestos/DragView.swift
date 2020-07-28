//
//  DragView.swift
//  15.Gestos
//
//  Created by Pedro Hamue on 18/07/20.
//  Copyright © 2020 Pedro Hamue. All rights reserved.
import SwiftUI

struct DragView: View {
    
@State private var hasBeenTouched = false
    
@GestureState private var hasBeenLongTouched = false
    
    var body: some View {
        Image(systemName: "calendar")
            .font(.system(size:150))
            .foregroundColor(.red)
            .opacity(hasBeenLongTouched ? 0.5 : 1.0)
            .scaleEffect(hasBeenTouched ? 2.0 : 1.0)
            .animation(.easeIn)
        .gesture(
            LongPressGesture(minimumDuration: 0.5 )
                .updating($hasBeenLongTouched){ (value,state,transaction) in
                  state = value
            }
                .onEnded{ _ in
                    self.hasBeenTouched.toggle()
        }
        )
    }
}

struct DragView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

