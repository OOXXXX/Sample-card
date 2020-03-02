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
    
    
    var body: some View {
        ZStack {
            AboutTitleView()
                .blur(radius: show ? 20 : 0)
                .animation(.default)
                        
            BackCardView()
                .background(show ? Color ("card3") : Color("card4"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -320: -40.0)
                .scaleEffect(0.9)
                .rotationEffect(.degrees(show ? 0 : 10))
                .rotation3DEffect(Angle(degrees: 10.0), axis: (x: 10.0, y: 0.0, z: 0.0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.5))
            
            BackCardView()
                .background(show ? Color ("card4") : Color("card3"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -98: -20.0)
                .scaleEffect(0.95)
                .rotationEffect(.degrees(show ? 0: 5))
                .rotation3DEffect(Angle(degrees: 5), axis: (x: 10.0, y: 0.0, z: 0.0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.3))
            
            ForeCard()
                .blendMode(.hardLight)
                .offset(x: 0, y: show ? 80: 0)
                .animation(.easeInOut)
                .onTapGesture {
                    self.show.toggle()
                
            }
                
            BottomCardView()
                .offset(x: 0, y: show ? 565 : 500)
                .animation(.easeInOut)
                .blur(radius: show ? 20 : 0)
                .animation(.default)
                    
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
        .frame(width: 340.0, height: 220.0)
        .background(Color.black)
        .cornerRadius(20)
        .shadow(radius: 20)
    }
}

struct BackCardView: View {
    var body: some View {
        VStack {
            Spacer()
        }
        .frame(width: 340.0, height: 220.0)
        
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
                .padding(.top, 10.0)
                .lineSpacing(5)
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 20)
        
    }
}
