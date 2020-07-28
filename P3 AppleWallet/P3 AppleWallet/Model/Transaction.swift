//
//  Transaction.swift
//  P3 AppleWallet
//
//  Created by Pedro Hamue on 27/07/20.
//  Copyright © 2020 Pedro Hamue. All rights reserved.
//

import Foundation
struct Transaction: Identifiable{
var id = UUID()
var seller : String
var amount: Double
var date: String
var icon: String = "dollarsign.circle.fill"
}
let transactions = [
    Transaction(seller: "Amazon", amount: 299.99,date: "07/07/2020"),
    Transaction(seller: "Cinépolis", amount: 120,date: "09/07/2020",icon: "film.fill"),
    Transaction(seller: "Apple", amount: 3499,date: "15/07/2020",icon: "cart.fill"),
    Transaction(seller: "HBO MAX", amount: 349,date: "18/07/2020",icon: "tv.circle.fill"),
]
