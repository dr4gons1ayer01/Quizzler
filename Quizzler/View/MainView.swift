//
//  MainView.swift
//  Quizzler
//
//  Created by Иван Семенов on 19.02.2024.
//

import UIKit

class MainView: UIView {
    let scoreLabel = UILabel()
    let questionLabel = UILabel()
    let trueButton = UIButton(type: .system)
    let falseButton = UIButton(type: .system)
    let progressView = UIProgressView()
    let bottomImageView = UIImageView(image: UIImage(named: "Background-Bubbles"))

    init() {
        super.init(frame: CGRect())
        setupUI()
    }

    func setupUI() {
        backgroundColor = UIColor(named: "bg")
        scoreLabel.text = "счет: 0"
        scoreLabel.textAlignment = .left
        scoreLabel.font = UIFont(name: "Gilroy-Regular", size: 22)
        scoreLabel.textColor = .white
        questionLabel.text = "Question"
        questionLabel.textAlignment = .center
        questionLabel.numberOfLines = 8
        questionLabel.font = UIFont(name: "Gilroy-Regular", size: 26)
        questionLabel.textColor = .white

        trueButton.setTitle("правда", for: .normal)
        falseButton.setTitle("ложь", for: .normal)
        questionLabel.heightAnchor.constraint(equalToConstant: 480).isActive = true
        trueButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        falseButton.heightAnchor.constraint(equalToConstant: 60).isActive = true

        let stack = UIStackView(arrangedSubviews: [
            scoreLabel, questionLabel, trueButton, falseButton
        ])
        stack.axis = .vertical
        stack.spacing = 20

        addSubview(stack)
        addSubview(bottomImageView)
        addSubview(progressView)

        stack.translatesAutoresizingMaskIntoConstraints = false
        bottomImageView.translatesAutoresizingMaskIntoConstraints = false
        progressView.translatesAutoresizingMaskIntoConstraints = false

        trueButton.titleLabel?.font = UIFont(name: "Gilroy-Regular", size: 26)
        falseButton.titleLabel?.font = UIFont(name: "Gilroy-Regular", size: 26)

        trueButton.layer.borderWidth = 2
        trueButton.layer.borderColor = UIColor(white: 1, alpha: 0.6).cgColor
        trueButton.layer.cornerRadius = 12
        trueButton.setTitleColor(.white, for: .normal)

        falseButton.layer.borderWidth = 2
        falseButton.layer.borderColor = UIColor(white: 1, alpha: 0.6).cgColor
        falseButton.layer.cornerRadius = 12
        falseButton.setTitleColor(.white, for: .normal)

        progressView.tintColor = .white
        progressView.trackTintColor = .systemPink

        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            stack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),

            bottomImageView.heightAnchor.constraint(equalToConstant: 102),
            bottomImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomImageView.bottomAnchor.constraint(equalTo: bottomAnchor),

            progressView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
            progressView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -30),
            progressView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
    
    func addShadow(to button: UIButton) {
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOffset = CGSize(width: 1, height: 2)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

import SwiftUI

struct MainViewProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().ignoresSafeArea()
    }
    struct ContainerView: UIViewRepresentable {
        let view = MainView()
        
        func makeUIView(context: Context) -> some UIView {
            return view
        }
        func updateUIView(_ uiView: UIViewType, context: Context) { }
    }
}
