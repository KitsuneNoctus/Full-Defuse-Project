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
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(buttonSound), for: .touchUpInside)
        return button
    }()
    
    let bubbleButton2: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "theBubbleImage"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(buttonSound), for: .touchUpInside)
        return button
    }()
    
    let bubbleButton3: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "theBubbleImage"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(buttonSound), for: .touchUpInside)
        return button
    }()
    
    let bubbleButton4: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "theBubbleImage"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(buttonSound), for: .touchUpInside)
        return button
    }()
    
    let bubbleButton5: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "theBubbleImage"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(buttonSound), for: .touchUpInside)
        return button
    }()
    
    let bubbleButton6: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "theBubbleImage"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(buttonSound), for: .touchUpInside)
        return button
    }()
    
    let bubbleButton7: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "theBubbleImage"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(buttonSound), for: .touchUpInside)
        return button
    }()
    
    let bubbleButton8: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "theBubbleImage"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(buttonSound), for: .touchUpInside)
        return button
    }()
    
    let bubbleButton9: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "theBubbleImage"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.imageView?.contentMode = .scaleAspectFit
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
    
    //MARK: Sound Effects
    var soundEffect: AVAudioPlayer?
    
    //MARK: Init
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = .purple
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
        
        //MARK: Constraints
        NSLayoutConstraint.activate([
            vStack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            vStack.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            vStack.heightAnchor.constraint(equalTo: self.heightAnchor),
            
            
            bubbleButton.heightAnchor.constraint(equalToConstant: 30),
            bubbleButton2.heightAnchor.constraint(equalToConstant: 30),
            bubbleButton3.heightAnchor.constraint(equalToConstant: 30),
            bubbleButton4.heightAnchor.constraint(equalToConstant: 30),
            bubbleButton5.heightAnchor.constraint(equalToConstant: 30),
            bubbleButton6.heightAnchor.constraint(equalToConstant: 30),
            bubbleButton7.heightAnchor.constraint(equalToConstant: 30),
            bubbleButton8.heightAnchor.constraint(equalToConstant: 30),
            bubbleButton9.heightAnchor.constraint(equalToConstant: 30),
            bubbleButton.widthAnchor.constraint(equalToConstant: 30),
            bubbleButton2.widthAnchor.constraint(equalToConstant: 30),
            bubbleButton3.widthAnchor.constraint(equalToConstant: 30),
            bubbleButton4.widthAnchor.constraint(equalToConstant: 30),
            bubbleButton5.widthAnchor.constraint(equalToConstant: 30),
            bubbleButton6.widthAnchor.constraint(equalToConstant: 30),
            bubbleButton7.widthAnchor.constraint(equalToConstant: 30),
            bubbleButton8.widthAnchor.constraint(equalToConstant: 30),
            bubbleButton9.widthAnchor.constraint(equalToConstant: 30),
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
        let path = Bundle.main.path(forResource: "food_candy_bubblegum_blow_bubble_pop.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)

        do {
            soundEffect = try AVAudioPlayer(contentsOf: url)
            soundEffect?.play()
        } catch {
            print("Pop")
        }
    }
    
}
