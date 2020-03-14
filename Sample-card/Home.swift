//
//  Home.swift
//  Sample-card
//
//  Created by Rhapsody on 2020/3/3.
//  Copyright © 2020 Rhapsody. All rights reserved.
//

import SwiftUI

struct Home: View {
    @State var showProfile = false
    @State var viewState = CGSize.zero
    
    var body: some View {
        ZStack {
            Color("background1")
            .edgesIgnoringSafeArea(.all)
            
            HomeView(showProfile: $showProfile)
            .padding(.top, 45)
            
             .background(
                    VStack {
                LinearGradient(gradient: Gradient(colors: [Color("background2"), Color("background4")]), startPoint: .top, endPoint: .bottom)
                            .frame(height: 200)
                                   Spacer()
                        }
            .background(Color("background4"))
      )
            .clipShape(RoundedRectangle(cornerRadius: showProfile ? 30 : 0, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .offset(y: showProfile ? -450 : 0)
            .rotation3DEffect(Angle(degrees: showProfile ? Double(viewState.height / 10) - 10 : 0), axis: (x: 10.0, y: 0, z: 0))
            .scaleEffect(showProfile ? 0.9 : 1)
            .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            .edgesIgnoringSafeArea(.all)
            
            MenuView()
                .background(Color.black.opacity(0.001))
                .offset(y: showProfile ? 0 : screen.height)
                .offset(y: viewState.height)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture {
                    self.showProfile.toggle()
            }
            .gesture(
                DragGesture().onChanged { value in
                    self.viewState = value.translation
                    if self.viewState.height < -15 {
                    self.viewState.height = -15
                    }
                }
                .onEnded { value in
                    if self.viewState.height > -5 {
                       self.showProfile = false
                        
                    }
                    
                    self.viewState = .zero
                }
            )
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct AvatarView: View {
    @Binding var showProfile: Bool
    
    var body: some View {
        Button(action: { self.showProfile.toggle() }) {
            Image("Avatar")
                .renderingMode(.original)
                .resizable()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
         
        }
    }
}


//let screen = UIScreen.main.bounds
