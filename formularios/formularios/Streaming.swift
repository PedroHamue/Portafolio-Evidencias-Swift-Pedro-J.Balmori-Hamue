//
//  Streaming.swift
//  formularios
//
//  Created by Pedro Hamue on 09/07/20.
//  Copyright © 2020 Pedro Hamue. All rights reserved.
//

import Foundation
struct Streaming: Identifiable{
    var id = UUID()
    var name: String
    var image:String
    var priceLevel: Int
    var purchased: Bool = false
    var feature: Bool = false
    
}
