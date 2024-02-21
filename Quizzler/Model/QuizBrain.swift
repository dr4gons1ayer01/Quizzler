//
//  QuizBrain.swift
//  Quizzler
//
//  Created by Иван Семенов on 21.02.2024.
//

import UIKit

struct QuizBrain {
    var questionNumber = 0
    var score = 0
    let quiz = [
//        Question(text: "4 + 2 = 6?", answer: "true"),
//        Question(text: "5 - 3 = 1?", answer: "false"),
//        Question(text: "3 + 8 = 10?", answer: "false"),
        
        Question(text: "Кровь слизняка зеленая?", answer: "true"),
        Question(text: "В стопах человека находится примерно четверть костей человека?", answer: "true"),
        Question(text: "Общая площадь поверхности двух легких человека составляет примерно 70 квадратных метров?", answer: "true"),
        Question(text: "В Западной Вирджинии, США, если вы случайно сбили на машине животное, вы можете забрать его домой, чтобы поесть?", answer: "true"),
        Question(text: "В Лондоне, Великобритания, если вам случится умереть в здании Парламента, технически вы имеете право на государственные похороны, поскольку это здание считается слишком священным местом?", answer: "false"),
        Question(text: "В Португалии запрещено писать в океан?", answer: "true"),
        Question(text: "Корову можно спустить вниз, но не вверх по лестнице?", answer: "false"),
        Question(text: "Изначально Google назывался «Backrub?", answer: "true"),
        Question(text: "Девичья фамилия матери Базза Олдрина была Мун?", answer: "true"),
        Question(text: "Самый громкий звук, издаваемый любым животным, составляет 188 децибел. Это животное — африканский слон?", answer: "false"),
        Question(text: "Ни один квадратный лист сухой бумаги нельзя сложить пополам более 7 раз?", answer: "false"),
        Question(text: "Шоколад влияет на сердце и нервную систему собаки; нескольких унций достаточно, чтобы убить маленькую собаку?", answer: "true"),
    ]
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        guard questionNumber < quiz.count else {
            questionNumber = 0
            return false
        }
        let correctAnswer = quiz[questionNumber % quiz.count].answer
        let isCorrect = userAnswer == correctAnswer
        if isCorrect {
            score += 1
        }
        questionNumber = (questionNumber + 1) % quiz.count
        if questionNumber == 0 {
            score = 0
        }
        return isCorrect
    }
    
    func getQuestionText() -> String {
        guard questionNumber < quiz.count else { return "over" }
        let index = questionNumber % quiz.count
        return quiz[index].text
    }
    
    func getProgress() -> Float {
        guard quiz.count != 0 else { return 0 }
        return Float(questionNumber) / Float(quiz.count)
    }
    
    func getScore() -> Int {
        return score
    }
    
    func blinkColorButton(for button: UIButton, isCorrect: Bool) {
        let color: UIColor = isCorrect ? .systemGreen : .systemRed
        button.backgroundColor = color
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            button.backgroundColor = .clear
        }
    }
}


