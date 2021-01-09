//
//  FidgetViewController.swift
//  Defuse2
//
//  Created by Henry Calderon on 1/7/21.
//

import UIKit
import AVFoundation

class FidgetViewController: UIViewController {
    
    //MARK: Objects Used
    let switchOne: UISwitch = {
        let swit = UISwitch()
        swit.translatesAutoresizingMaskIntoConstraints = false
        swit.addTarget(self, action: #selector(switchValueChanged), for: .touchUpInside)
        return swit
    }()
    
    let stepOne: UIStepper = {
        let step = UIStepper()
        step.translatesAutoresizingMaskIntoConstraints = false
        step.minimumValue = -1500
        step.maximumValue = 1500
        step.stepValue = 1
        step.addTarget(self, action: #selector(useStepperOne), for: .touchUpInside)
        return step
    }()
    
    let sliderOne: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = -255
        slider.maximumValue = 255
        slider.value = 0.5
        slider.addTarget(self, action: #selector(sliderSlide), for: .valueChanged)
        return slider
    }()
    
    let textField: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textAlignment = .center
        text.text = "Type Whatever"
        text.font = UIFont(name: "System", size: 16)
        return text
    }()
    
    let aButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("{[A]}", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(aButtonPressed), for: .touchUpInside)
//        button.tintColor = .systemBlue
        return button
    }()
    
    let aLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font
        label.text = "Poetry"
        return label
    }()
    
    let segmentControl: UISegmentedControl = {
        let segment = UISegmentedControl()
        segment.translatesAutoresizingMaskIntoConstraints = false
        segment.insertSegment(withTitle: "Bubbles", at: 0, animated: true)
        segment.insertSegment(withTitle: "Key", at: 1, animated: true)
        segment.selectedSegmentIndex = 0
        return segment
    }()
    
    //MARK: Organiziers
    let hStackOne: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.spacing = 30
        return stack
    }()
    
    let hStackTwo: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.spacing = 30
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
    
    let bubbleView = BubbleView()
    let KeyView = UIView()
    
//    let keyView = UIView {
//        let view = UIView()
//        return view
//    }()
//
//    let bubbleView = UIView {
//        let view = UIView()
//        return view
//    }()
    
    let aLabelWordList = ["They're","There","Their","your","you're","bear","bare","angle","angel"]
    
    var soundEffect: AVAudioPlayer?
    var redValue = CGFloat.random(in:0..<1)

    //MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "Fidget"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.isHidden = false
        setup()
    }
    
    //MARK: Setup
    func setup(){
        self.view.addSubview(vStack)
        self.vStack.addArrangedSubview(hStackOne)
        self.hStackOne.addArrangedSubview(switchOne)
        self.hStackOne.addArrangedSubview(stepOne)
        
        self.vStack.addArrangedSubview(sliderOne)
        self.vStack.addArrangedSubview(textField)
        
        self.vStack.addArrangedSubview(hStackTwo)
        self.hStackTwo.addArrangedSubview(aButton)
        self.hStackTwo.addArrangedSubview(aLabel)
        
        self.vStack.addArrangedSubview(segmentControl)
        
//        self.view.addSubview(bubbleView)
//        bubbleView.backgroundColor = .purple
        
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 40),
            vStack.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            vStack.widthAnchor.constraint(equalToConstant: 350),
            vStack.heightAnchor.constraint(equalToConstant: 400),
            
//            BubbleView.heightAnchor.constraint(equalToConstant: 100),
//            BubbleView.widthAnchor.constraint(equalToConstant: 100),
        ])
        
//        bubbleView.constraints.
//        bubbleView.topAnchor.constraint(equalTo: vStack.bottomAnchor, constant: 20).isActive = true
//        bubbleView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
    }
    
    //MARK: Actions
    @objc func sliderSlide(){
        let rNum = Int.random(in: 0...255)
        let gNum = Int.random(in: 0...255)
        let bNum = Int.random(in: 0...255)
        self.view.backgroundColor = UIColor(red: CGFloat(Double(rNum)/255.0), green: CGFloat(Double(gNum)/255.0), blue: CGFloat(Double(bNum)/255.0), alpha: 0.7)
    }
    
    @objc func switchValueChanged(){
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.prepare()
        generator.impactOccurred()
        
        let path = Bundle.main.path(forResource: "switchSound.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)

        do {
            soundEffect = try AVAudioPlayer(contentsOf: url)
            soundEffect?.play()
        } catch {
            // couldn't load file :(
        }
    }
    
    @objc func useStepperOne(){
        let path = Bundle.main.path(forResource: "clickSound.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)

        do {
            soundEffect = try AVAudioPlayer(contentsOf: url)
            soundEffect?.play()
        } catch {
            // couldn't load file :(
        }
    }
    
    @objc func aButtonPressed(){
        let path = Bundle.main.path(forResource: "crackSoud.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)

        do {
            soundEffect = try AVAudioPlayer(contentsOf: url)
            soundEffect?.play()
        } catch {
            // couldn't load file :(
        }
        let textBit = aLabelWordList[Int.random(in: 0..<aLabelWordList.count)]
        aLabel.text = textBit
    }
    
    @objc func viewSegmentControlUsed(){
        
    }

    
}
