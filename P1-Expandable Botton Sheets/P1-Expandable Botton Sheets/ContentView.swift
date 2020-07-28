//
//  ContentView.swift
//  P1-Expandable Botton Sheets
//
//  Created by Pedro Hamue on 21/07/20.
//  Copyright © 2020 Pedro Hamue. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showCourseDetail = false
    @State private var selectedCourse: Course?

    var body: some View {
        ZStack{
        NavigationView{
            
            List{
                ForEach(courses){ course in
                    BasicRow(course: course)
                        .onTapGesture {
                            self.showCourseDetail = true
                            self.selectedCourse = course
                    }
                }
            }
        .navigationBarTitle("Cursos Online")
        }
        .offset(y:self.showCourseDetail ?  -150: 0)
        .animation(.easeIn(duration:0.25))
            
            if showCourseDetail {
                BlanketView(color:.gray)
                    .opacity(0.5)
                    .onTapGesture {
                        self.showCourseDetail = false
                }
            self.selectedCourse.map{
                CourseDetailView(course: $0, isShowing: $showCourseDetail)
                    .transition(.move(edge:.bottom))
                }
        
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct BasicRow: View{
    var course: Course
    var body: some View{
        HStack{
            Image(course.image)
                .resizable()
                 .aspectRatio(contentMode: .fill)
                .frame(width:120, height:90)
                .cornerRadius(20)
            Text(course.name)
        }
    }
}
struct BlanketView: View{
    var color: Color
    var body: some View{
        VStack{
            Spacer()
            
        }
        .frame(minWidth:0,maxWidth: .infinity,maxHeight: .infinity)
    .background(color)
        .edgesIgnoringSafeArea(.all)
    }
}
