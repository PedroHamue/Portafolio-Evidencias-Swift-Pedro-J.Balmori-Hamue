//
//  Card.swift
//  P3 AppleWallet
//
//  Created by Pedro Hamue on 27/07/20.
//  Copyright © 2020 Pedro Hamue. All rights reserved.
//

import Foundation
enum CardType: String {
    case visa
    case master
    
}

struct Card: Identifiable {
    var id = UUID()
    var clientName : String
    var number : String
    var expirationDate: String
    var type: CardType
    var image: String
}
let tempCards = [
    Card(clientName: "Pedro José Balmori", number:" 0000 0000 0000 0000", expirationDate: "01/21", type: .visa, image: "Tarjeta 1"),
     Card(clientName: "Juan Hernadez", number:" 3230 1400 0500 1020", expirationDate: "02/23", type: .master ,image: "Tarjeta 2"),
       Card(clientName: "Juan Montes", number:" 1250 1302 1510 1150", expirationDate: "05/21", type: .master ,image: "tarjeta 3"),
        Card(clientName: "Jonathan Gallardo", number:" 3450 6372 4211 1940", expirationDate: "12/24", type: .master ,image: "Tarjeta 4"),
]
