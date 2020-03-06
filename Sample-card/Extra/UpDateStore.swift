//
//  UpDateStore.swift
//  Sample-card
//
//  Created by Rhapsody on 2020/3/3.
//  Copyright © 2020 Rhapsody. All rights reserved.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    @Published var updates: [Update] = updateData
}
