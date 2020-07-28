//
//  ContentView.swift
//  TinderApp
//
//  Created by Pedro Hamue on 25/07/20.
//  Copyright © 2020 Pedro Hamue. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    private let threshold: CGFloat = 100
    @GestureState private var dragState = DragState.none
    @State private var lastCardIdx = 1
    @State private var actualEscuderia : Escuderia = escuderias[0]
    @State var deck: [CardView] = {
        var cards = [CardView]()
        for idx in 0..<2 {
            cards.append(CardView(escuderia: escuderias[idx]))
        }
        return cards
    }()
    @State private var removalTransition = AnyTransition.leadingBottomAtRemoval
    var body: some View {
        VStack{
            TopBarView()
            Spacer(minLength: 10)
            ZStack{
                ForEach(deck){ card in
                    card
                        .zIndex(self.isTopCard(card:card) ? 1 : 0)
                    .overlay(
                        ZStack{
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.red)
                                .font(.system(size:120))
                                .opacity(self.dragState.translation.width < -self.threshold && self.isTopCard(card:card) ? 1 : 0)
                            Image(systemName: "heart.fill")
                                .foregroundColor(.green)
                                .font(.system(size:120))
                                .opacity(self.dragState.translation.width > self.threshold && self.isTopCard(card: card) ? 1 : 0)
                        }
                    
                    )
                        .offset(x:self.isTopCard(card:card) ? self.dragState.translation.width:0,y:self.isTopCard(card:card) ? self.dragState.translation.height:0)
                        
                        .scaleEffect(self.dragState.isDragging && self.isTopCard(card: card) ? 0.9:1.0)
                        .rotationEffect(Angle(degrees: Double(self.isTopCard(card:card) ? self.dragState.translation.width/10 : 0)))
                        .animation(.interpolatingSpring(stiffness: 200, damping:100 ))
                        .transition(self.removalTransition)
                        .gesture(LongPressGesture(minimumDuration: 0.01)
                            .sequenced(before: DragGesture())
                        .updating(self.$dragState,body: { (value,state,transaction) in
                            switch value {
                            case .first(true):
                                state = .pressing
                            case .second(true,let drag):
                                state = .dragging(translation: drag?.translation ?? .zero)
                            default:
                                break
                            }
                            
                        })
                            .onChanged{ (value) in
                                guard case .second(true, let drag?) = value else{
                                return
                                }
                                self.removalTransition = drag.translation.width > 0 ? .trailingBottomRemoval : .leadingBottomAtRemoval
                        }
                            .onEnded{ (value) in
                                guard case .second(true,let drag?) = value else{
                                    return
                                }
                                //if drag.translation.width > self.threshold || drag.translation.width < -self.threshold{
                                    //self.updateDeck()
                                if drag.translation.width > self.threshold{
                                self.updateDeck(true)
                                }

                                if drag.translation.width < -self.threshold{
                                self.updateDeck(false)
                                }
                            })
                
                }
                
            }

            BottomBarView(escuderia: self.actualEscuderia)
                .opacity(self.dragState.isDragging ? 0.1 : 1.0)
                .animation(.linear)
        }
        
    }
    private func isTopCard(card: CardView) -> Bool {
        guard let idx = deck.firstIndex(where: {$0.id == card.id})
            else{
            return false
        }
        
        return idx == 0
    }
    private func updateDeck( _ liked: Bool){
        deck.removeFirst()
        
        if escuderias.count <= 0 {
        print("no more cards")
        }else{
        if liked {
       escuderias.removeAll { (escuderia) -> Bool in
        self.actualEscuderia.name == escuderia.name
        }
        if escuderias.count <= 1 {
        print("no more cards")
        }else{
        let tempId = (self.lastCardIdx-1) % escuderias.count
        self.actualEscuderia = escuderias[tempId]
     
        
        let newEscuderia = escuderias[self.lastCardIdx % escuderias.count]
        let newCardView = CardView(escuderia: newEscuderia)
        self.actualEscuderia = newEscuderia
        deck.append(newCardView)
    }
        }else{
            self.lastCardIdx += 1
            
            let tempId = (self.lastCardIdx-1) % escuderias.count
                   self.actualEscuderia = escuderias[tempId]
                
                   
                   let newEscuderia = escuderias[self.lastCardIdx % escuderias.count]
                   let newCardView = CardView(escuderia: newEscuderia)
                   self.actualEscuderia = newEscuderia
                   deck.append(newCardView)
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            TopBarView().previewLayout(.sizeThatFits)
            BottomBarView(escuderia: escuderias[0]).previewLayout(.fixed(width:400,height:100))
        }
    }
}
struct TopBarView: View {
    var body: some View{
        HStack{
            Image(systemName: "line.horizontal.3")
                .font(.system(size:25))
                .foregroundColor(.black)
            Spacer()
            Image(systemName:"book.fill")
                .font(.system(size:35))
             .foregroundColor(.black)
            Spacer()
            Image(systemName:"archivebox.fill")
                .font(.system(size:25))
        }.padding(15)
    }
}
struct BottomBarView: View{
    var escuderia: Escuderia
    var body: some View{
        HStack{
            Image(systemName: "xmark")
                .font(.system(size:25))
                .foregroundColor(.red)
            Spacer()
            Button(action:{
                if let url = URL(string: "https://es.wikipedia.org/wiki/Fórmula_1\(self.escuderia.image)") {
                    UIApplication.shared.open(url)
                }
            },label:{
                Text("super like")
                .bold()
                    .foregroundColor(.white)
                    .padding(.all,20)
                    .background(Color.black)
                .cornerRadius(12)
                
            })
                .padding(15)
            
            Spacer()
            Image(systemName: "heart")
                .font(.system(size:25))
                .foregroundColor(.green)
            
        }.padding(15)
    }
}


}
