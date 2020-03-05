//
//  BlogView.swift
//  Sample-card
//
//  Created by Rhapsody on 2020/3/5.
//  Copyright © 2020 Rhapsody. All rights reserved.
//

import SwiftUI

struct BlogView: View {
    var body: some View {
        Webview(url: "https://www.ooxxxx.club")
            .edgesIgnoringSafeArea(.top)
    }
}

struct BlogView_Previews: PreviewProvider {
    static var previews: some View {
        BlogView()
    }
}
