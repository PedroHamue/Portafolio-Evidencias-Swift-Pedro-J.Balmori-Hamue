//
//  Extensions.swift
//  TinderApp
//
//  Created by Pedro Hamue on 26/07/20.
//  Copyright © 2020 Pedro Hamue. All rights reserved.
//

import Foundation
import SwiftUI
extension AnyTransition{
    static var trailingBottomRemoval: AnyTransition{
        AnyTransition.asymmetric(insertion: .identity, removal: AnyTransition.move(edge: .trailing).combined(with: .move(edge: .bottom)))
    }
    static var leadingBottomAtRemoval: AnyTransition{
        AnyTransition.asymmetric(insertion: .identity, removal: AnyTransition.move(edge: .leading).combined(with: .move(edge: .bottom)))
    }
}
