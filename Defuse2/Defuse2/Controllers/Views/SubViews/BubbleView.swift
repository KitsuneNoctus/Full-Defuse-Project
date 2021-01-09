//
//  BubbleView.swift
//  Defuse2
//
//  Created by Henry Calderon on 1/8/21.
//

import UIKit
import AVFoundation

class BubbleView: UIView {
    
    //MARK: A lot of stuff - Buttons
    let bubbleButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "theBubbleImage"), for: .normal)
        button.addTarget(self, action: #selector(buttonSound), for: .touchUpInside)
        return button
    }()
    
    let bubbleButton2: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "theBubbleImage"), for: .normal)
        button.addTarget(self, action: #selector(buttonSound), for: .touchUpInside)
        return button
    }()
    
    let bubbleButton3: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "theBubbleImage"), for: .normal)
        button.addTarget(self, action: #selector(buttonSound), for: .touchUpInside)
        return button
    }()
    
    let bubbleButton4: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "theBubbleImage"), for: .normal)
        button.addTarget(self, action: #selector(buttonSound), for: .touchUpInside)
        return button
    }()
    
    let bubbleButton5: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "theBubbleImage"), for: .normal)
        button.addTarget(self, action: #selector(buttonSound), for: .touchUpInside)
        return button
    }()
    
    let bubbleButton6: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "theBubbleImage"), for: .normal)
        button.addTarget(self, action: #selector(buttonSound), for: .touchUpInside)
        return button
    }()
    
    let bubbleButton7: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "theBubbleImage"), for: .normal)
        button.addTarget(self, action: #selector(buttonSound), for: .touchUpInside)
        return button
    }()
    
    let bubbleButton8: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "theBubbleImage"), for: .normal)
        button.addTarget(self, action: #selector(buttonSound), for: .touchUpInside)
        return button
    }()
    
    let bubbleButton9: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "theBubbleImage"), for: .normal)
        button.addTarget(self, action: #selector(buttonSound), for: .touchUpInside)
        return button
    }()
    
    //MARK: Stack Views
    let hStackOne: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.spacing = 20
        return stack
    }()
    
    let hStackTwo: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.spacing = 20
        return stack
    }()
    
    let hStackThree: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.spacing = 20
        return stack
    }()
    
    let vStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .center
        stack.spacing = 20
//        stack.widthAnchor = 100
        return stack
    }()
    
    //MARK: Init
    override init(frame: CGRect){
        super.init(frame: frame)
        self.frame.size.height = 300
        self.frame.size.width = 300
        self.addSubview(vStack)
        vStack.addArrangedSubview(hStackOne)
        vStack.addArrangedSubview(hStackTwo)
        vStack.addArrangedSubview(hStackThree)
        
        hStackOne.addArrangedSubview(bubbleButton)
        hStackOne.addArrangedSubview(bubbleButton2)
        hStackOne.addArrangedSubview(bubbleButton3)
        
        hStackTwo.addArrangedSubview(bubbleButton4)
        hStackTwo.addArrangedSubview(bubbleButton5)
        hStackTwo.addArrangedSubview(bubbleButton6)
        
        hStackThree.addArrangedSubview(bubbleButton7)
        hStackThree.addArrangedSubview(bubbleButton8)
        hStackThree.addArrangedSubview(bubbleButton9)
        
        NSLayoutConstraint.activate([
            vStack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            vStack.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Action
    @objc func buttonSound(){
        print("Pop")
    }
    
}
