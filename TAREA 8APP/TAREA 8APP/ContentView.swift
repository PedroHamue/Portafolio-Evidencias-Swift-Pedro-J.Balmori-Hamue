//
//  ContentView.swift
//  TAREA 8APP
//
//  Created by Pedro Hamue on 04/07/20.
//  Copyright © 2020 Pedro Hamue. All rights reserved.
//
import SwiftUI

struct ListView: View {
var courses = [
Course(imageName: "netflix", authorName: "Juan Gabriel Gomila", courseTitle: "Curso completo de Machine Learning: Data Science con RStudio", originalPrice: "$2,970", discountPrice: "$120"),
Course(imageName: "disney", authorName: "Juan Gabriel Gomila", courseTitle: "Probabilidad para Machine Learning y Big Data con R y Python", originalPrice: "$2,970", discountPrice: "$120"),
Course(imageName: "prime", authorName: "Juan Gabriel Gomila", courseTitle: "Curso completo de R para Data Science con Tidyverse", originalPrice: "$2,970", discountPrice: "$120"),
Course(imageName: "hbo", authorName: "Juan Gabriel Gomila", courseTitle: "Estadística inferencial para Machine Learning con R y Python", originalPrice: "$2,970", discountPrice: "$120")
]

init() {
    let appearance = UINavigationBarAppearance()
    appearance.largeTitleTextAttributes = [
        .font: UIFont(name: "Avenir Next", size: 32)!,
        .foregroundColor: UIColor.purple
    ]
    appearance.titleTextAttributes = [
        .font: UIFont(name: "Avenir Next", size: 18)!,
        .foregroundColor: UIColor.purple
    ]
    appearance.setBackIndicatorImage(UIImage(systemName: "arrow.left.square.fill"), transitionMaskImage: UIImage(systemName: "arrow.left.square"))
    UINavigationBar.appearance().tintColor = .purple
    UINavigationBar.appearance().standardAppearance = appearance
    UINavigationBar.appearance().compactAppearance = appearance
    UINavigationBar.appearance().scrollEdgeAppearance = appearance
}
var body: some View {
    NavigationView {
        List(courses) { course in
    NavigationLink(destination: DetailView(course: course)) {
      CardView(imageName: course.imageName, authorName: course.authorName, courseTitle: course.courseTitle, originalPrice: course.originalPrice, discountPrice: course.discountPrice)
            }
        }
        .navigationBarTitle("Cursos Online")
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}

struct Course: Identifiable {
    var id = UUID()
    var imageName: String
    var authorName: String
    var courseTitle: String
    var originalPrice: String
    var discountPrice: String
}



