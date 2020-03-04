//
//  Modifiers.swift
//  Sample-card
//
//  Created by Rhapsody on 2020/3/3.
//  Copyright © 2020 Rhapsody. All rights reserved.
//

import SwiftUI

struct DoubleRadiusShadow: ViewModifier {
    func body(content: Content) -> some View {
        content
                .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
    }
}

struct FontCoustom: ViewModifier {
    var size: CGFloat
    
    func body(content: Content) -> some View {
        content.font(.custom("Oxygen-Bold", size: size))
    }
}

struct FontCoustom2: ViewModifier {
    var size: CGFloat
    
    func body(content: Content) -> some View {
        content.font(.custom("UbuntuCondensed-Regular", size: size))
    }
}
