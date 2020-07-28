//
//  DetailView.swift
//  TAREA 8APP
//
//  Created by Pedro Hamue on 04/07/20.
//  Copyright © 2020 Pedro Hamue. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    var course: Course

       var body: some View {
           VStack {
               Image(course.imageName)
               .resizable()
               .aspectRatio(contentMode: .fill)
               .frame(height: 300)
               .clipped()
               Text(course.courseTitle)
               .font(.system(.title, design: .rounded))
               .fontWeight(.bold)
               .multilineTextAlignment(.center)
               .frame(width: 300)
               .lineLimit(3)
               Text(course.authorName)
               .font(.system(.subheadline, design: .rounded))
               .multilineTextAlignment(.center)
               Text(course.discountPrice)
               .font(.subheadline)
               .foregroundColor(.primary)
               Text(course.originalPrice)
               .font(.caption)
               .foregroundColor(.secondary)
               .strikethrough()
               Spacer()
           }
       }
   }

   struct DetailView_Previews: PreviewProvider {
    static var previews: some View {imageName:"netflix", authorName: "Juan Gabriel Gomila", courseTitle: "Curso completo de Machine Learning: Data Science con RStudio", originalPrice: "$2,970", discountPrice: "$120"))
       }
   }
