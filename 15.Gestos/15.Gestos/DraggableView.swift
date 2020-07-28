//
//  DraggableView.swift
//  15.Gestos
//
//  Created by Pedro Hamue on 19/07/20.
//  Copyright © 2020 Pedro Hamue. All rights reserved.
//

import SwiftUI

struct DraggableView<Content>: View where Content: View {
   @GestureState private var dragState = DragState.none
   // @GestureState private var hasBeenLongTouched = false
    @State private var position = CGSize.zero
    //@GestureState private var offset = CGSize.zero
    var content: () -> Content
    var body: some View {
    content()
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

struct DraggableView_Previews: PreviewProvider {
    static var previews: some View {
        DraggableView(){
            Text("Hola xd")
            //Image(systemName: "calendar")
                .font(.system(size:40))
                .foregroundColor(.red)
                
        }
    }
}
enum DragState {
    case none
    case pressing
    case dragging(translation: CGSize)
    var translation: CGSize{
        switch self{
        case .none, .pressing:
            return .zero
        case .dragging(let translation):
            return translation
        }
        
    }
    var isPressing: Bool{
        switch self{
        case .pressing, .dragging:
            return true
        case .none:
            return false
        }
    }
}
