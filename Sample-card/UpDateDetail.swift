//
//  UpDateDetail.swift
//  Sample-card
//
//  Created by Rhapsody on 2020/3/3.
//  Copyright © 2020 Rhapsody. All rights reserved.
//

import SwiftUI

struct UpdateDetail: View {
    var update: Update = updateData[2]
    
    var body: some View {
        List {
            VStack(spacing: 20) {
                Image(update.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                Text(update.text)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .navigationBarTitle(update.title)
        }
        .listStyle(PlainListStyle())
    }
}

struct UpdateDetail_Previews: PreviewProvider {
    static var previews: some View {
        UpdateDetail()
    }
}
