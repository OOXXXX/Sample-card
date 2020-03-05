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
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(spacing: 30) {
                    Text("Categories")
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
                        .frame(height: getCardHeight())
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
        ZStack(alignment: .top) {
            VStack(alignment: .leading,spacing: 30) {
                Text(course.context)
                
                Text("About this course")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("This course is unlike any other. We care about design and want to make sure that you get better at it in the process. It was written for designers and developers who are passionate about collaborating and building real apps for iOS and macOS. While it's not one codebase for all apps, you learn once and can apply the techniques and controls to all platforms with incredible quality, consistency and performance. It's beginner-friendly, but it's also packed with design tricks and efficient workflows for building great user interfaces and interactions.")
                    .foregroundColor(Color("secondary"))
                
                Text("Minimal coding experience required, such as in HTML and CSS. Please note that Xcode 11 and Catalina are essential. Once you get everything installed, it'll get a lot friendlier! I added a bunch of troubleshoots at the end of this page to help you navigate the issues you might encounter.")
                .foregroundColor(Color("secondary"))
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
                            .lineLimit(3)
                            .foregroundColor(.white)
                            .animation(nil)
                        Text(course.subtitle)
                            .foregroundColor(Color.white.opacity(0.7))
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
                Spacer()
                WebImage(url: course.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .frame(height: 140, alignment: .top)
            }
            .padding(show ? 30 : 20)
            .padding(.top, show ? 30 : 0)
    //        .frame(width: show ? screen.width : screen.width - 60, height: show ? screen.height : 280)
            .frame(maxWidth: show ? .infinity : screen.width - 60, maxHeight: show ? 280 : 270)
                .background(Color(course.color))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color(course.color).opacity(0.3), radius: 20, x: 0, y: 20)
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
                .background(Color("background1"))
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
    var context: String
    var image: URL
    var logo: UIImage
    var color: UIColor
    var show: Bool
    
    
}

var courseData = [
    Course(title: ("Last night in 2019"), subtitle: "18 Sections", context: " ", image: URL(string: "https://dl.dropbox.com/s/pmggyp7j64nvvg8/Certificate%402x.png?dl=0")!, logo: #imageLiteral(resourceName: "Logo1"), color: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), show: false),
]
