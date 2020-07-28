//
//  ContentView.swift
//  Tarea 9APP
//
//  Created by Pedro Hamue on 30/06/20.
//  Copyright © 2020 Pedro Hamue. All rights reserved.
//

import SwiftUI



struct ContentView: View {



@State private var isPay = false

@State private var statusProcess = 0.0

@State private var statusText = "Desea Pagar?"



var body: some View {

ZStack {

Text(statusText)

.font(.system(.largeTitle, design: .rounded))

.bold()

.offset(x: 0, y: -120)

isPay ? nil : buttonPay(payState: $isPay, status: $statusProcess, statusText: $statusText)

if statusProcess == 2.0 {

Circle()

.stroke(Color(.systemBlue), lineWidth: 5)

.frame(width: 120 , height: 120, alignment: .center)



.overlay(

Image(systemName: "checkmark")

.font(.system(size: 40, weight: .bold, design: .rounded))

.foregroundColor(.blue)

)



} else {



processView(payState: $isPay)



}





}

}

}



struct ContentView_Previews: PreviewProvider {

static var previews: some View {

ContentView()

}

}



struct buttonPay: View {



@Binding var payState: Bool

@Binding var status: Double

@Binding var statusText: String



var body: some View {

Button(action: {

self.statusText = "Procesando.."

self.payState.toggle()

Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (Timer) in

self.status += 0.1

if self.status > 2.0 {

Timer.invalidate()

self.status = 2.0

self.statusText = "Pago Realizado."



}

}



}) {

Circle()

.stroke( lineWidth: 5)

.frame(width: 120 , height: 120, alignment: .center)

.overlay(

Text("Pagar")

.font(.system(size: 22, weight: .bold, design: .rounded))



)}

}

}



struct processView: View {



@Binding var payState: Bool



var body: some View {





Circle()

.trim(from: 0.0, to: 0.9)

.stroke(Color(.systemBlue), lineWidth: 5)

.frame(width: 120 , height: 120, alignment: .center)

.rotationEffect(Angle(degrees: self.payState ? 360 : 0))

.animation(Animation.linear(duration: 1).repeatCount(3, autoreverses: false))







}



}
