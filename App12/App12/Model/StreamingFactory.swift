//
//  StreamingFactory.swift
//  App12
//
//  Created by Pedro Hamue on 09/07/20.
//  Copyright © 2020 Pedro Hamue. All rights reserved.
//

import Foundation
struct StreamingFactory{
   static var streamings = [
           Streaming(name:"Netflix",image:"netflix"),
           Streaming(name:"HBO GO",image:"hbo"),
           Streaming(name:"Disney +",image:"disney",feature:true),
             Streaming(name:"Amazon Prime Video",image:"prime")
       ]
}
