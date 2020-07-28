//
//  SortingOrderType.swift
//  formularios
//
//  Created by Pedro Hamue on 14/07/20.
//  Copyright © 2020 Pedro Hamue. All rights reserved.
//

import Foundation
enum SortingOrderType:Int,CaseIterable {
case alphabetical = 0
case feature = 1
case purchased = 2
    init(type: Int){
        switch type{
        case 0:
            self = .alphabetical
        case 1:
            self = .feature
        case 2:
            self = .purchased
        default:
            self = .alphabetical
        }
}
    var description: String {
        switch self{
        case .alphabetical:
            return "Alfabéticamente"
        case .feature:
            return "Los favoritos al inicio"
        case .purchased:
            return "Los comprados al inicio"
      
        }
        
}
    func predicateSort() -> ((Streaming,Streaming) -> Bool){
          switch self {
          case .alphabetical:
              return {$0.name < $1.name}
          case .feature:
              return {$0.feature && !$1.feature}
          case .purchased:
              return {$0.purchased && !$1.purchased}
              
}
}
}
