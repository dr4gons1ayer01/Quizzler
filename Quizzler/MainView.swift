//
//  MainView.swift
//  Quizzler
//
//  Created by Иван Семенов on 19.02.2024.
//

import UIKit

class MainView: UIView {
    let question = UILabel()
    let trueButton = UIButton(type: .system)
    let falseButton = UIButton(type: .system)
    let progress = UIProgressView()
    let bottomImageView = UIImageView(image: UIImage(named: "Background-Bubbles"))

    init() {
        super.init(frame: CGRect())
        setupUI()
    }

    func setupUI() {
        backgroundColor = UIColor(named: "bg")
        question.text = "Question"
        question.textAlignment = .center
        question.numberOfLines = 3
        question.font = UIFont(name: "Gilroy-Regular", size: 26)
        question.textColor = .white

        trueButton.setTitle("true", for: .normal)
        falseButton.setTitle("false", for: .normal)
        trueButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        falseButton.heightAnchor.constraint(equalToConstant: 60).isActive = true

        let stack = UIStackView(arrangedSubviews: [
            question, trueButton, falseButton, progress
        ])
        stack.axis = .vertical
        stack.spacing = 20

        addSubview(stack)
        addSubview(bottomImageView)

        stack.translatesAutoresizingMaskIntoConstraints = false
        bottomImageView.translatesAutoresizingMaskIntoConstraints = false
        progress.translatesAutoresizingMaskIntoConstraints = false

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

        progress.tintColor = .white
        progress.trackTintColor = .systemPink

        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            stack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),

            bottomImageView.heightAnchor.constraint(equalToConstant: 102),
            bottomImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomImageView.bottomAnchor.constraint(equalTo: bottomAnchor),

            progress.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
            progress.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -30),
            progress.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
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
