//
//  ViewController.swift
//  Quizzler
//
//  Created by Иван Семенов on 19.02.2024.
//

import UIKit

class ViewController: UIViewController {
    let mainView = MainView()
    var questionNumber = 0
    let quiz = [
        Question(text: "4 + 2 = 6?", answer: "true"),
        Question(text: "5 - 3 = 1?", answer: "false"),
        Question(text: "3 + 8 = 10?", answer: "false"),
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        updateUI()
        
        tapTrue()
        tapFalse()
    }
    func updateUI() {
        if questionNumber < quiz.count {
            mainView.question.text = quiz[questionNumber].text
        } else {
            print("вопросы закончились")
            questionNumber = 0
            mainView.question.text = quiz[questionNumber].text
        }
    }
    
    func answerButton(isTrue: Bool) {
        let userAswer = isTrue ? "true" : "false"
        let correctAnswer = quiz[questionNumber].answer
        
        if userAswer == correctAnswer {
            print("верно")
        } else {
            print("неа")
        }
        
        questionNumber += 1
        updateUI()
    }
    
    func tapTrue() {
        let tap = UIAction { _ in
            self.answerButton(isTrue: true)
            self.blinkButton(for: self.mainView.trueButton)
        }
        mainView.trueButton.addAction(tap, for: .touchUpInside)
    }
    func tapFalse() {
        let tap = UIAction { _ in
            self.answerButton(isTrue: false)
            self.blinkButton(for: self.mainView.falseButton)
        }
        mainView.falseButton.addAction(tap, for: .touchUpInside)
    }
    
    func blinkButton(for button: UIButton) {
        button.layer.borderColor = UIColor(white: 1, alpha: 1).cgColor
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            button.layer.borderColor = UIColor(white: 1, alpha: 0.6).cgColor
        }
    }
    
}

