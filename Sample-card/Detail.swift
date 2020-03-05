//  ContextDetail.swift
//  Sample-card
//
//  Created by Rhapsody on 2020/3/4.
//  Copyright © 2020 Rhapsody. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct CourseDetail: View {
    var course: Course
    @Binding var show: Bool
    @Binding var active: Bool
    @Binding var activeIndex: Int
    @State var appear = false
    
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text(course.title)
                                .font(.system(size: 24, weight: .bold))
                                .lineLimit(3)
                                .foregroundColor(.gray)
                            Text(course.subtitle.uppercased())
                                .foregroundColor(.gray)
                                .modifier(FontCoustom2(size: 18))
                        }
                        Spacer()
                        ZStack {
                            VStack {
                                Image(systemName: "xmark")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(.white)
                                    //.background(Color("Color"))
                            }
                            .frame(width: 36, height: 36)
                        //    .background(Color("Color"))
                            .background(Color("Buttom"))
                            .clipShape(Circle())
                            .onTapGesture {
                                self.show = false
                                self.active = false
                                self.activeIndex = -1
                                
                            }
                        }
                    }
                    .opacity(appear ? 1 : 0)
                    .animation(.linear(duration: 0.6))
                    .onAppear {
                        self.appear = true
                    }
                    
                    Spacer()
                    
                    WebImage(url: course.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .frame(height: 140, alignment: .top)
                }
                .padding(30)
                .padding(.top, 44)
                .frame(height: 270)
                .frame(maxWidth: 712)
                .background(Color(course.color))
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
                
                VStack(alignment: .leading,spacing: 1) {
                    Text(course.context)
                .foregroundColor(Color("secondary"))
       
                }
                .padding(30)
                .padding(.bottom, 100)
                .frame(maxWidth: 712)
            }
            .frame(width: screen.width)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct CourseDetail_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetail(course: courseData[0], show: .constant(true), active: .constant(true), activeIndex: .constant(-1))
    }
}
