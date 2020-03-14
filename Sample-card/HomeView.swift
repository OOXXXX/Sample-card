//
//  HomeView.swift
//  Sample-card
//
//  Created by Rhapsody on 2020/3/3.
//  Copyright © 2020 Rhapsody. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @Binding var showProfile: Bool
    @State var showUpdate = false
    
    var body: some View {
        ScrollView{
            VStack {
                HStack {
                    Text("Welcome")
                       //.modifier(FontCoustom(size: 33))
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        
                    Spacer()
                    
                    AvatarView(showProfile: $showProfile)
                    
                    Button(action: { self.showUpdate.toggle() }) {
                        Image(systemName: "bolt.horizontal.fill")
                            .renderingMode(.original)
                            .font(.system(size: 18, weight: .medium))
                            .frame(width: 36, height: 36)
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                    }
                    .sheet(isPresented: $showUpdate) {
                        BlogView()
                    }
                }
                .padding(.horizontal)
                .padding(.leading, 10)
                .padding(.top, 30)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(sectionData) { item in
                            GeometryReader {
                                geometry in
                                SectionView(section: item)
//                                    .rotation3DEffect(Angle(degrees:
//                                            Double(geometry.frame(in: .global).minX - 30) / -20), axis: (x: 0, y: 10, z: 0))
                            }
                            .frame(width: 275, height: 160)
                        }
                    }
                    .padding(20)
                    .padding(.bottom, 30)
                }
                .offset(x: 0, y: -30)
                
                HStack {
                    Text("Section:")
                        .modifier(FontCoustom(size: 25))
                    Spacer()
                }
                .padding(.leading, 30)
                .offset(x: 0, y: -70)
                
                SectionView2(section: sectionData2[2], height: screen.width - 280, width: 330)
                .offset(x: 0, y: -70)
                
                
                SectionView2(section: sectionData2[2], height: screen.width - 280, width: 330)
                .offset(x: 0, y: -70)
                    .padding(.top, 8)
                
                SectionView2(section: sectionData2[2], height: screen.width - 280, width: 330)
                    .padding(.top, 8)
                .offset(x: 0, y: -70)
             
                
                }
            .frame(width: screen.width)
            }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false))
    }
}

struct SectionView: View {
    var section: Section
    var height: CGFloat = 160
    var width: CGFloat = 260
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text(section.title)
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(.white)
                Spacer()
                Image(section.logo)
            }
            
            Text(section.text.uppercased())
                .frame(maxWidth: .infinity, alignment: .leading)
            
//            section.image
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 210)
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width: width, height: height)
        .background(section.color)
        .cornerRadius(10)
        .shadow(color: Color("HomeCard").opacity(0.3), radius: 20, x: 0, y: 20)
    }
}

struct Section: Identifiable {
    var id = UUID()
    var title: String
    var text: String
    var logo: String
    //var image: Image
    var color: Color
}

let sectionData = [
    Section(title: " ", text: " ", logo: " ", color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))),
    Section(title: " ", text: " ", logo: " ", color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))),
//    Section(title: "SwiftUI Advanced", text: "20 Sections", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "Card2")), color: Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))),
    Section(title: " ", text: " ", logo: " ", color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))),
]

struct SectionView2: View {
    var section: Section
    var height: CGFloat = 80
    var width: CGFloat = 260
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text(section.title)
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(.white)
                Spacer()
                Image(section.logo)
            }
            
            Text(section.text.uppercased())
                .frame(maxWidth: .infinity, alignment: .leading)
            
//            section.image
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 210)
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width: width, height: height)
        .background(section.color)
        .cornerRadius(14)
        .shadow(color: Color("HomeCard").opacity(0.3), radius: 20, x: 0, y: 20)
    }
}

let sectionData2 = [
    Section(title: " ", text: " ", logo: " ", color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))),
    Section(title: " ", text: " ", logo: " ", color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))),
//    Section(title: "SwiftUI Advanced", text: "20 Sections", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "Card2")), color: Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))),
    Section(title: " ", text: " ", logo: " ", color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))),
]

struct Section2: Identifiable {
    var id = UUID()
    var title: String
    var text: String
    var logo: String
    //var image: Image
    var color: Color
}
