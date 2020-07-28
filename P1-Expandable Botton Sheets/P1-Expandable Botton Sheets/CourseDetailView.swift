//
//  CourseDetailView.swift
//  P1-Expandable Botton Sheets
//
//  Created by Pedro Hamue on 21/07/20.
//  Copyright © 2020 Pedro Hamue. All rights reserved.
//

import SwiftUI

struct CourseDetailView: View {
    @GestureState private var dragState = DragState.none
    @State private var offset: CGFloat = 0
    @State private var cardState = CardState.half
    @State var selected = -1
     var course: Course
    @Binding var isShowing: Bool
    var body: some View {
        GeometryReader{ geometry in
        VStack{
            Spacer()
            HandleBar()
            TitleBar(titleText: "Detalles del Curso")
            ScrollView(.vertical){
                HeaderView(course: self.course)
                if self.selected != -1{
                         Text(" \(self.selected + 1)").padding(.bottom,10)
                            .offset(x:50,y:95)
                     }
                RatingsView(selected: self.$selected)
                 
                DescriptionView(icon: "dollarsign.circle.fill",content:"\(self.course.priceLevel)")
             
                .padding(.top)
                DescriptionView(icon: nil, content:  self.course.description)
            
            }
        .animation(nil)
            .disabled(self.cardState == .half || self.dragState.isDragging)
        }
        
        .background(Color.white)
    .cornerRadius(15,antialiased: true)
        .offset(y:geometry.size.height*0.45 + self.dragState.translation.height + self.offset)
        .animation(.interpolatingSpring(stiffness:200,damping:50,initialVelocity:10))
        .edgesIgnoringSafeArea(.all)
        .gesture(DragGesture()
        .updating(self.$dragState){(value,state,transaction) in
            state = DragState.dragging(translation: value.translation)
            }
        .onEnded({ (value) in
            switch self.cardState{
            case .half:
                if value.translation.height < -0.25*geometry.size.height {
                    self.offset = -0.45*geometry.size.height+0.2*geometry.size.height
                    self.cardState = .full
                }
                if value.translation.height > 0.25*geometry.size.height{
                    self.isShowing = false
                }
                break
            case .full:
                if value.translation.height > 0.25*geometry.size.height{
                    self.offset = 0
                    self.cardState = .half
                }
                if value.translation.height > 0.75*geometry.size.height{
                    self.isShowing = false
                }
                break
            }
        })
        )
        }
    }
}

struct CourseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetailView(course:courses[0], isShowing: .constant(true))
            .background(Color.gray.opacity(0.5))
            .edgesIgnoringSafeArea(.all)
      
    }
}
struct HandleBar: View {
    var body: some View{
        Rectangle()
        .frame(width:70,height:10)
        .foregroundColor(Color(.systemGray4))
        .cornerRadius(8)
    }
}
struct TitleBar: View{
    var titleText: String
    var body: some View{
        Text(titleText)
        .font(.headline)
        .foregroundColor(.primary)
        .padding()
    }
}
struct HeaderView: View{
    var course: Course
    var body: some View{
        Image(course.image)
        .resizable()
        .scaledToFit()
            .frame(height:250)
        .overlay(
            HStack{
    
                VStack(alignment: .leading){
                    Text(course.name)
                        .foregroundColor(.black)
                        .font(.system(.title,design: .rounded))
                        .bold()
                    .offset(x:0,y:180)
                    Text(course.type)
                        .font(.system(.subheadline,design: .rounded))
                    .padding(5)
                        .background(Color.yellow)
                    .cornerRadius(6)
                        .offset(x:0,y:200)
                    
            }
                Spacer()
            }
        .padding()
        )
    }
}
struct RatingsView : View{
    @Binding var selected : Int
var body : some View{
    HStack(spacing: 10, content:{
                         ForEach(0..<5){i in
                         
                             Image(systemName: "star.fill").resizable().frame(width:30,height:30).foregroundColor(self.selected >= i ? .yellow :.gray)
                                .onTapGesture {
                                 self.selected = i
                         }
                         }
                     }) .offset(x:50,y:85)
}
}
struct DescriptionView: View{
    var icon: String?
    var content: String
    var body: some View{
        HStack{
            if icon != nil{
                Image(systemName: icon!)
                    .padding(.trailing,5)
                    .offset(x:0,y:150)
            }
            Text(content)
                .font(.system(.body,design: .rounded))
                
                .offset(x:0,y:150)
            Spacer()
        }.padding(.horizontal)
    }
    
    }

enum CardState{
    case half
    case full
}
