//
//  ContentView.swift
//  Sample-card
//
//  Created by Rhapsody on 2020/3/2.
//  Copyright © 2020 Rhapsody. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var show = false
    @State var viewState = CGSize.zero
    @State var showCard = false
    
    
    var body: some View {
        ZStack {
            AboutTitleView()
                .blur(radius: show ? 20 : 0)
                .opacity(showCard ? 0.4 : 1)
                .offset(x: 0, y: showCard ? -100 : 0)
                .animation(
                    Animation
                        .default
                        .delay(0.1)
            )
   
            BackCardView()
                //.background(show ? Color ("card3") : Color("card4"))
                .frame(width: showCard ? 300 : 340.0, height: 220.0)
                .background(Color ("card4"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: showCard ? -50 : 0)
                .offset(x: 0, y: show ? -320: -40.0)
                .offset(x: viewState.width, y: viewState.height)
                .scaleEffect(showCard ? 1 : 0.95)
                .rotationEffect(.degrees(show ? 0 : 10))
                .rotationEffect(.degrees(showCard ? -10 : 0))
                .rotation3DEffect(Angle(degrees: showCard ? 0 : 10.0), axis: (x:showCard ? 0 : 10, y: 0.0, z: 0.0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.5))
            
            BackCardView()
                //.background(show ? Color .pink : Color("card3"))
                .frame(width: 340.0, height: 220.0)
                .background(Color ("card3"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: showCard ? -25 : 0)
                .offset(x: 0, y: show ? -98: -20.0)
                .offset(x: viewState.width, y: viewState.height)
                .scaleEffect(showCard ? 1 : 0.95)
                .rotationEffect(.degrees(show ? 0: 5))
                .rotationEffect(.degrees(showCard ? -5 : 0))
                .rotation3DEffect(Angle(degrees: showCard ? 0 : 5.0), axis: (x:showCard ? 0 : 10, y: 0.0, z: 0.0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.3))
  
            
            ForeCard()
                .frame(width: showCard ? 375 : 340, height: 220)
                .background(Color.black)
//                .animation(.spring())
//                .cornerRadius(20)
                .clipShape(RoundedRectangle(cornerRadius: showCard ? 30 : 20, style: .continuous))
                .shadow(radius: 20)
                .offset(x: viewState.width, y: viewState.height)
                .animation(.spring(response: 0.3, dampingFraction: 0.5, blendDuration: 0))
                .blendMode(.hardLight)
                .offset(x: 0, y: show ? 80: 0)
                .animation(.easeInOut)
                .onTapGesture {
                    self.showCard.toggle()
            }
                .gesture(
                    DragGesture().onChanged { value in
                        self.viewState = value.translation
                        self.show = true
                    }
                    .onEnded { value in
                        self.viewState = .zero
                        self.show = false
                    }
                )
            BottomCardView()
            .offset(x: 0, y: showCard ? 360 : 1000)
            //.offset(x: 0, y: show ? 565 : 500)
            .animation(.easeInOut)
            .blur(radius: show ? 20 : 0)
            .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 1))
            //.animation(.easeInOut(duration: 0.8))
    
        }
    }
}

struct ForeCard: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Programming")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                    Text("Swift / Python / CSS")
                        .foregroundColor(Color("accent"))
                }
                
                Spacer()
                Image("Logo1")
            }
            .padding()
            Spacer()
            Image("Card1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 110, alignment: .top)
        }
    }
}

struct BackCardView: View {
    var body: some View {
        VStack {
            Spacer()
        }
    }
}

struct AboutTitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("About")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(.horizontal)
            .padding(5)
            Image("Background1")
                .padding(.top, -40.0)
            Spacer()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BottomCardView: View {
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 40, height: 5)
                .cornerRadius(3)
                .opacity(0.1)
            
            
            Text("One of my favorite hobbies is Programming. I always believe me as a developer and that’s also what I dream to be. I am interested in Swift, Python and some Front-end web development, including CSS, HTML and JavaScript.")
                
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
                .font(.custom("arial", size: 18))
                .frame(width: 345)
                .padding(.top, 10.0)
                .lineSpacing(5)
//                .cornerRadius(30)
                
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 20)
         
        
    }
}
