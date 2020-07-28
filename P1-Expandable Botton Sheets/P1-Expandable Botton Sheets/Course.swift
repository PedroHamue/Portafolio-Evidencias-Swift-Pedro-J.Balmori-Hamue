//
//  Course.swift
//  P1-Expandable Botton Sheets
//
//  Created by Pedro Hamue on 21/07/20.
//  Copyright © 2020 Pedro Hamue. All rights reserved.
//

import Foundation
struct Course: Identifiable {
    var id: UUID = UUID()
    var name: String
    var description: String
    var image: String
    var type: String
    var priceLevel: Int
    var visited: Bool = false
    
    init(name: String, description: String,image: String, type: String, priceLevel: Int){
        self.name = name
        self.description = description
        self.image = image
        self.type = type
        self.priceLevel = priceLevel
        self.visited = false
    }
    init(){
        self.init(name: "", description: "",image:"",type:"",priceLevel: 0)
    }
}
#if DEBUG
var courses: [Course] = [
    Course(name:"Curso Desarrollo de Apps en Android",
           description:"""
       ¿Sabías que 1 de cada 5 desarrolladores, están ganando más de 5.000$ al mes? ¿Sabías que no te hacen falta conocimientos de programación o diseño para conseguirlo?.
       Este curso se trata de la guía completa y esencial para que puedas llegar a ganar incluso más que esa cantidad en un mercado en total expansión, novedoso, con cabida para miles de emprendedores y lo mejor de todo ¡es asequible para cualquiera!, tanto a nivel de conocimientos como a nivel económico.
       En el curso, te explico totalmente, paso a paso y con total transparencia, mostrando casos reales en todo momento, como yo he conseguido ser emprendedor gracias al mercado de las Apps. Así podrás tener el mismo éxito que yo. En concreto, ¡muestro como hacer una App sencilla que en el primer trimestre de 2016 solo por publicidad hizo unos ingresos de unos 1.800$ con tan solo unos meses de vida!. Así, tu también podrás comenzar a generar ingresos a la misma vez que realizas el curso.
       Hace ya más de tres años cuando empecé, he desarrollado cientos de Apps y colaborado con muchos otros desarrolladores. Finalmente he hecho de ello un medio de vida, teniendo ingresos superiores a 5.000$ / mes.
       ¡Puedes llegar a tener tantos beneficios como desees con este método!, con el esfuerzo y dedicación adecuados.
       ¿Por qué este curso es diferente?
       Otros cursos te enseñan como comenzar contratando desarrolladores para tener tus propias Apps, sin embargo, con este curso aprenderás a crear tus propias Apps usando plataformas sencillas para el desarrollo de Apps.
       Para que te hagas una idea, al igual que se puede hacer una página web o blog utilizando, por ejemplo, una plataforma como WordPress o Blogger y no resulta difícil, aparte de ser innecesario cualquier conocimiento de programación, lo mismo ocurre en el mundo de las Apps, se pueden crear sin código de programación con plataformas específicas.
       Te puedo asegurar que comenzarás a monetizar este curso desde el primer momento con tus primeras Apps, así es, no debes esperar ni invertir para comenzar a ver ingresos que irán aumentando con el tiempo.
       ¿Te gustaría comenzar el 2016 desde otro punto de vista? ¿Te gustaría ser emprendedor? ¡Este es el curso que estabas buscando!
       ¿Sabías que el mercado de las Apps es uno de los que mayor potencial tiene en la actualidad? ¿Sabías que los beneficios generados en 2014 en global en el mercado de Apps fueron de 25 billones de dólares, pero, para 2016, se prevén que serán de 58 billones de dólares?.
       El curso está dirigido a todo aquel que quiera comenzar a aumentar sus ingresos e incluso, tenga interés por encontrar la independencia en lo que a trabajo se refiere, de una forma divertida, novedosa y con futuro. Sin conocer lenguajes de programación o tener buenas habilidades de diseño, y sin realizar ninguna inversión.
       Ahora bien, seré sincero, este curso tal vez no sea el más idóneo para aquellos quienes les gustaría ganar millones muy rápido y sin esfuerzo, el método explicado puede hacer ganar al menos 5.000$ / mes pero se debe dedicar tiempo y esfuerzo.
       Durante el curso aprenderás:
       Conocer el mercado de las Apps al completo y con todas sus particularidades.
       Cómo comenzar a hacer tus propias Apps usando plataformas específicas.
       Saber cómo monetizarlas, es decir, dentro de los diversos métodos de monetización de aplicaciones móviles, elegir cuál o que combinación de ellos te conviene para obtener el mejor rendimiento económico con cada App.
       Descubrir cómo promocionarlas, hacer marketing de tus Apps, usando desde plataformas que forman parte de nuestro día a día, como las redes sociales, Facebook, Twitter o Instagram, así como con publicidad en plataformas específicas para conseguir descargas o mediante publicidad en grandes plataformas como puede ser Google.
""",
           image:"AppAndroid",
           type:"programación",
           priceLevel:3),
    Course(name:"Curso Desarrollo de Apps en Xcode con lenguaje Swift",
           description:"""
        Aprende a desarrollar apps para
        dispositivos iOS,MacOS,WatchOS
        y AppleTV
""",
           image:"Swift",
           type:"programación",
           priceLevel:5),
    Course(name:"Curso Desarrollo de videojuegos con Unity",
           description:"""
        Aprende a desarrollar los mejores videojuegos,
        mediante Unity
""",
           image:"Unity",
           type:"programación",
           priceLevel:5),
    Course(name:"Curso Desarrollo de páginas web",
            description:"""
           Conviertete en un maestro del diseño de
            páginas web con este curso
           """,
           image:"DiseñoPaginaWeb",
           type:"programación",
           priceLevel:2),
    Course(name:"Curso de Diseño 2D y 3D en Autocad",
           description:"""
           Aprende a diseñar desde una tuerca hasta
            una casa completa en 2nda
            y tercera dimensión con este curso
           """,
           image:"cursoAutocad",
           type:"Diseño",
           priceLevel:1)

]

#endif
