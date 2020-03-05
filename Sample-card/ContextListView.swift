//
//  ContextView.swift
//  Sample-card
//
//  Created by Rhapsody on 2020/3/4.
//  Copyright © 2020 Rhapsody. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct CourseList: View {
    @ObservedObject var store = CourseStore()
    @State var active = false
    @State var activeIndex = -1
    @State var activeView = CGSize.zero
    
    
    var body: some View {
        ZStack {
            Color.black.opacity(Double(self.activeView.height/500))
                .animation(.linear)
                
                .background(Color("background3"))
                .edgesIgnoringSafeArea(.all)
            
            
            ScrollView {
                VStack(spacing: 30) {
                    Text("Posts")
                        .font(.system(.largeTitle))
                        .fontWeight(.bold)
                        .alignmentGuide(.leading, computeValue: { _ in -30})
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 20)
                        .animation(nil)
                    
                    ForEach(store.courses.indices, id: \.self) { index in
                        GeometryReader { geometry in
                            CourseView(
                                show: self.$store.courses[index].show,
                                course: self.store.courses[index],
                                active: self.$active,
                                index: index,
                                activeIndex: self.$activeIndex,
                                activeView: self.$activeView
                            )
                                .offset(y: self.store.courses[index].show ? -geometry.frame(in: .global).minY : 0)
                                .opacity(self.activeIndex != index && self.active ? 0 : 1)
                                .scaleEffect(self.activeIndex != index && self.active ? 0.5 : 1)
                                .offset(x: self.activeIndex != index && self.active ? screen.width : 0)
                        }
                        .frame(height: 260)
                        .frame(maxWidth: self.active ? 712 : getCardWidth())
                    }
                }
                .frame(width: screen.width)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                
            }
        }
    }
}

struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseList()
    }
}

struct CourseView: View {
    @Binding var show: Bool
    var course: Course
    @Binding var active: Bool
    var index: Int
    @Binding var activeIndex: Int
    @Binding var activeView: CGSize
    
    var body: some View {
        ZStack() {
            VStack(alignment: .leading,spacing: 30) {
                Text(course.context)
                
            }
            
            .padding(30)
            .offset(y: show ? 300 : 0)
            .frame(maxWidth: show ? .infinity : getCardWidth())
            .frame(maxHeight: show ? screen.height : 100, alignment: .top)
            .background(Color("background3"))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .opacity(show ? 1 : 0)
            
            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 8.0) {
                        Text(course.title)
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(Color.gray)
                            .lineLimit(3)
                            
                            .animation(nil)
                           // .padding(.top, -20)
                        Text(course.subtitle)
                            .foregroundColor(Color.black.opacity(0.7))
                            .animation(nil)
                    }
                    Spacer()
                    ZStack {
                        Image(uiImage: course.logo)
                            .opacity(show ? 0 : 1)
                        
                        VStack {
                            Image(systemName: "xmark")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.white)
                        }
                        .frame(width: 36, height: 36)
                        .background(Color.black)
                        .clipShape(Circle())
                        .opacity(show ? 1 : 0)
                    }
                    
                }
                .padding(.top, -30)
                Spacer()
                
                WebImage(url: course.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .frame(height: 140, alignment: .top)
            }
            .padding(show ? 30 : 20)
            .padding(.top, show ? 30 : 40)
    //        .frame(width: show ? screen.width : screen.width - 60, height: show ? screen.height : 280)
            .frame(maxWidth: show ? .infinity : screen.width - 60, maxHeight: show ? 280 : 270)
                .background(Color(course.color))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 20)
//            .gesture(
//                show ?
//                DragGesture().onChanged { value in
//                    guard value.translation.height < 300 else { return }
//                    guard value.translation.height > 0 else { return }
//
//                    self.activeView = value.translation
//                }
//                .onEnded { value in
//                    if self.activeView.height > 50 {
//                        self.show = false
//                        self.active = false
//                        self.activeIndex = -1
//                    }
//                    self.activeView = .zero
//                }
//                : nil
//            )
            .onTapGesture {
                self.show.toggle()
                self.active.toggle()
                if self.show {
                    self.activeIndex = self.index
                } else {
                    self.activeIndex = -1
                }
            }
            
           if show {
            CourseDetail(course: course, show: $show, active: $active, activeIndex: $activeIndex)
                .background(Color("background3"))
                .animation(.linear(duration: 0))
                }
        }
        .frame(height: show ? screen.height : 250)
//        .scaleEffect(1 - self.activeView.height / 1000)
//        .rotation3DEffect(Angle(degrees: Double(self.activeView.height / 10)), axis: (x: 0, y: 10.0, z: 0))
//        .hueRotation(Angle(degrees: Double(self.activeView.height)))
//        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
//        .gesture(
//            show ?
//            DragGesture().onChanged { value in
//                guard value.translation.height < 300 else { return }
//                guard value.translation.height > 0 else { return }
//
//                self.activeView = value.translation
//            }
//            .onEnded { value in
//                if self.activeView.height > 50 {
//                    self.show = false
//                    self.active = false
//                    self.activeIndex = -1
//                }
//                self.activeView = .zero
//            }
//            : nil
//        )
//        .edgesIgnoringSafeArea(.all)
    }
}

struct Course: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
    var textColour: UIColor
    var context: String
    var image: URL
    var logo: UIImage
    var color: UIColor
    var show: Bool
    
    
    
}

var courseData = [
    
    Course(title: ("The HomeTown"), subtitle: ("Nanjing©️"), textColour: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), context: " ", image: URL(string: "https://i.loli.net/2020/03/05/7GyAwmKTfgBctYn.png")!, logo: #imageLiteral(resourceName: "Logo2"), color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), show: false),
]
