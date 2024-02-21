//
//  ViewController.swift
//  Quizzler
//
//  Created by Иван Семенов on 19.02.2024.
//

import UIKit

class ViewController: UIViewController {
    let mainView = MainView()
    var quizBrain = QuizBrain()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        updateUI()
        
        tapTrue()
        tapFalse()
    }

    func updateUI() {
        mainView.scoreLabel.text = "счет: \(quizBrain.getScore())"
        mainView.questionLabel.text = quizBrain.getQuestionText()
        mainView.progressView.setProgress(quizBrain.getProgress(), animated: true)
    }

    func answerButton(isTrue: Bool) {
        let userAnswer = isTrue ? "true" : "false"
        let isCorrect = quizBrain.checkAnswer(userAnswer)
        quizBrain.blinkColorButton(for: isTrue ? mainView.trueButton : mainView.falseButton, isCorrect: isCorrect)
        updateUI()
    }
    
    func tapTrue() {
        let tap = UIAction { _ in
            self.answerButton(isTrue: true)
            
        }
        mainView.trueButton.addAction(tap, for: .touchUpInside)
        mainView.addShadow(to: mainView.trueButton)
    }
    func tapFalse() {
        let tap = UIAction { _ in
            self.answerButton(isTrue: false)
            
        }
        mainView.falseButton.addAction(tap, for: .touchUpInside)
        mainView.addShadow(to: mainView.falseButton)
    }
    
    
    
}

