//
//  HomeViewController.swift
//  Defuse
//
//  Created by Henry Calderon on 1/7/21.
//  Copyright © 2021 Henry Calderon. All rights reserved.
//

import UIKit
import CoreData

class HomeViewController: UIViewController {
    
    let fidgetButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Fidget", for: .normal)
        button.setTitleColor(.systemGray, for: .normal)
        button.addTarget(self, action: #selector(navFidget), for: .touchUpInside)
        return button
    }()
    
    let notesButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Notes", for: .normal)
        button.setTitleColor(.systemGray, for: .normal)
        button.addTarget(self, action: #selector(navNotes), for: .touchUpInside)
        return button
    }()
    
    let angerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Anger", for: .normal)
        button.setTitleColor(.systemGray, for: .normal)
        button.addTarget(self, action: #selector(navAnger), for: .touchUpInside)
        return button
    }()
    
    let anxietyButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Anxiety", for: .normal)
        button.setTitleColor(.systemGray, for: .normal)
        button.addTarget(self, action: #selector(navAnxiety), for: .touchUpInside)
        return button
    }()
    
    let moreButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("More", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(navMore), for: .touchUpInside)
        return button
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont(name: label.font.fontName, size: 45)
        label.text = "Defuse"
        return label
    }()
    
    let buttonStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.spacing = 20
        return stack
    }()
    
    //MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        setup()
    }
    
    //MARK: Setup
    func setup(){
        self.view.addSubview(titleLabel)
        self.view.addSubview(buttonStack)
        buttonStack.addArrangedSubview(fidgetButton)
        buttonStack.addArrangedSubview(notesButton)
        buttonStack.addArrangedSubview(angerButton)
        buttonStack.addArrangedSubview(anxietyButton)
        buttonStack.addArrangedSubview(moreButton)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50),
            titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            buttonStack.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 40),
            buttonStack.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
    
    //MARK: Actions / Nav
    @objc func navFidget(){
        let nextVC = FidgetViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func navNotes(){
        let nextVC = NotesViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func navAnger(){
        let nextVC = EmotionViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func navAnxiety(){
        let nextVC = EmotionViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func navMore(){
        let nextVC = EmotionViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }

}
