//
//  ContentView.swift
//  15.Gestos
//
//  Created by Pedro Hamue on 18/07/20.
//  Copyright © 2020 Pedro Hamue. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @GestureState private var dragState = DragState.none
   // @GestureState private var hasBeenLongTouched = false
    @State private var position = CGSize.zero
    //@GestureState private var offset = CGSize.zero
    
    var body: some View {
        Image(systemName: "calendar")
            .font(.system(size:150))
            .foregroundColor(.red)
            .opacity(dragState.isPressing ? 0.5 : 1.0)
            .offset(x: position.width + dragState.translation.width, y: position.height + dragState.translation.height)
            .animation(.easeIn)
        .gesture(
            LongPressGesture(minimumDuration: 0.5 )
            .sequenced(before: DragGesture())
            .updating($dragState){(value,state, transaction) in
                switch value{
                case .first(true):
                    state = .pressing
                case .second(true,let drag):
                    state = .dragging(translation: drag?.translation ?? .zero)
                default:
                    break
                }
            }
           .onEnded{ (value) in
            guard case .second(true, let drag?) = value else{
                return
            }
            self.position.height += drag.translation.height
            self.position.width += drag.translation.width
            }
        )
            .opacity(dragState.isPressing ? 0.5 : 1.0)
            .offset(x: position.width + dragState.translation.width, y: position.height + dragState.translation.height)
            .animation(.easeIn)
        .gesture(
            LongPressGesture(minimumDuration: 0.5 )
            .sequenced(before: DragGesture())
            .updating($dragState){(value,state, transaction) in
                switch value{
                case .first(true):
                    state = .pressing
                case .second(true,let drag):
                    state = .dragging(translation: drag?.translation ?? .zero)
                default:
                    break
                }
            }
           .onEnded{ (value) in
            guard case .second(true, let drag?) = value else{
                return
            }
            self.position.height += drag.translation.height
            self.position.width += drag.translation.width
            }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

