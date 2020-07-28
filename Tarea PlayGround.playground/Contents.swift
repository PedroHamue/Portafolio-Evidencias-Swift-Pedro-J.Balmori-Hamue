import UIKit
var myJson = """
{
    "quiz": {
        "sport": {
            "q1": {
                "question": "Which one is correct team name in NBA?",
                "options": [
                    "New York Bulls",
                    "Los Angeles Kings",
                    "Golden State Warriros",
                    "Huston Rocket"
                ],
                "answer": "Huston Rocket"
            }
        },
        "maths": {
            "q1": {
                "question": "5 + 7 = ?",
                "options": [
                    "10",
                    "11",
                    "12",
                    "13"
                ],
                "answer": "12"
            },
            "q2": {
                "question": "12 - 8 = ?",
                "options": [
                    "1",
                    "2",
                    "3",
                    "4"
                ],
                "answer": "4"
            }
        }
    }
}
"""
struct Quiz: Codable {

var quiz: Questions

}



struct Questions: Codable {

var sport: QuizSport

var maths: QuizMaths

}



struct QuizSport: Codable {

var q1: QuizQuestion

}



struct QuizMaths: Codable {

var q1: QuizQuestion

var q2: QuizQuestion

}



struct QuizQuestion: Codable {

var question: String

var options: [String]

var answer: String

}



if let jsonData = myJson.data(using: .utf8) {

do {

let quiz = try JSONDecoder().decode(Quiz.self, from: jsonData)

print(quiz.quiz.sport.q1.question)

} catch {

print(error)

}

}


