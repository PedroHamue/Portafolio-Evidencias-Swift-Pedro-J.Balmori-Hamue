//
//  Escuderia.swift
//  TinderApp
//
//  Created by Pedro Hamue on 25/07/20.
//  Copyright © 2020 Pedro Hamue. All rights reserved.
//

import Foundation
struct Escuderia{
var name: String
var image: String
}
#if DEBUG
var escuderias: [Escuderia] = [
    Escuderia(name: "RED BULL RACING",image:"AstonMartin"),
    Escuderia(name: "FERRARI",image:"ferrari"),
    Escuderia(name: "MCLAREN",image:"mclaren"),
    Escuderia(name: "AMG PETRONAS MOTORSPORT",image:"Mercedes"),
    Escuderia(name: "RENAULT",image:"renault"),
    Escuderia(name: "RACING POINT",image:"racingpoint"),
]
#endif
