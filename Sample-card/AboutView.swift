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
    @State var bottomState = CGSize.zero
    
    
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
                .background(Color ("secondary"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: showCard ? -50 : 0)
                .offset(x: 0, y: show ? -300: -40.0)
                .offset(x: viewState.width, y: viewState.height)
                .scaleEffect(showCard ? 1 : 0.95)
                .rotationEffect(.degrees(show ? 0 : 10))
                .rotationEffect(.degrees(showCard ? -10 : 0))
                .rotation3DEffect(Angle(degrees: showCard ? 0 : 10.0), axis: (x:showCard ? 0 : 10, y: 0.0, z: 0.0))
 //               .blendMode(.colorDodge)
                .animation(.easeInOut(duration: 0.5))
            
            BackCardView()
                //.background(show ? Color .pink : Color("card3"))
                .frame(width: 340.0, height: 220.0)
                .background(Color ("secondary"))
                
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
                .background(Image("Desktop").resizable())
                .clipShape(RoundedRectangle(cornerRadius: showCard ? 30 : 20, style: .continuous))
                .shadow(radius: 20)
                .offset(x: viewState.width, y: viewState.height)
                .animation(.spring(response: 0.3, dampingFraction: 0.5, blendDuration: 0))
                //.blendMode(.color)
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
            
//            Text("\(bottomState.height)").offset(y: -300)
            
            BottomCardView()
            .offset(x: 0, y: showCard ? 310 : 1000)
            .offset(y: bottomState.height)
            //.offset(x: 0, y: show ? 565 : 500)
            .animation(.easeInOut)
            .blur(radius: show ? 20 : 0)
            .animation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 0))
            //.animation(.easeInOut(duration: 0.8))
            .gesture(
                DragGesture().onChanged { value in
                    self.bottomState = value.translation
                    if self.bottomState.height < -210 {
                       self.bottomState.height = -210
                    }
                    
                }
                .onEnded { value in
                    if self.bottomState.height > 50 {
                        self.showCard = false
                    }
                    self.bottomState = .zero
                }
            )
        }
        
        .statusBar(hidden: showCard ? true : false)
        .animation(.easeIn)
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
                    .modifier(FontCoustom(size: 16))
                    .foregroundColor(Color("Color"))
                }
                
                Spacer()
                Image("swift")
                .resizable()
                .frame(width: 40, height: 40)
                .offset(x: 0, y: -3)
            }
            .padding()
            Spacer()
//            Image("Desktop")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 300, height: 110, alignment: .top)
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
//                    .modifier(FontCoustom(size: 35))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
                .padding(.horizontal)
                .padding(.leading, 10)
                .padding(.top, 3)
            Image("Background1")
                .padding(.top, -20.0)
            Spacer()
            
        }
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
//              .cornerRadius(30)
                        
            Spacer()
           
            
            
            Image("Image")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .offset(x: 0, y: -70)
            Text("2020 Patrick Zhu™️")
                 .modifier(FontCoustom2(size: 18))
            //.frame(width: 20, height: 20, alignment: .center)
            .offset(x: 0, y: -120)

        }
            
        .padding()
        .background(Color("background3"))
        .cornerRadius(30)
        .shadow(radius: 20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
