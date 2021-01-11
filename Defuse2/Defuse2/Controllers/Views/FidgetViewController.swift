//
//  FidgetViewController.swift
//  Defuse2
//
//  Created by Henry Calderon on 1/7/21.
//

import UIKit
import AVFoundation
//Sound from Zapsplat.com

class FidgetViewController: UIViewController {
    
    var backgroundColours = [UIColor(red:0.79, green:0.96, blue:0.80, alpha:1.0), UIColor(red:0.82, green:0.69, blue:0.97, alpha:1.0), UIColor(red:0.75, green:0.94, blue:0.98, alpha:1.0), UIColor(red:0.95, green:0.95, blue:0.87, alpha:1.0), UIColor(red:0.97, green:0.87, blue:0.90, alpha:1.0)]
    
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
        slider.minimumValue = 0
        slider.maximumValue = 6
        slider.value = 0
        slider.widthAnchor.constraint(equalToConstant: 300).isActive = true
//        slider.isContinuous = true
        slider.addTarget(self, action: #selector(sliderSlide), for: .valueChanged)
        return slider
    }()
    
    let textField: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textAlignment = .center
        text.text = "Type Whatever"
        text.font = UIFont(name: "System", size: 16)
        text.returnKeyType = .done
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
        segment.addTarget(self, action: #selector(viewSegmentControlUsed), for: .touchUpInside)
        return segment
    }()
    
    //MARK: Organiziers
    let hStackOne: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.alignment = .center
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
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.spacing = 10
//        stack.widthAnchor = 100
        return stack
    }()
    
    let bubbleView = BubbleView()
    let KeyView = UIView()
    
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
//        self.view.addSubview(bubbleView)
        
        self.vStack.addArrangedSubview(hStackOne)
        self.hStackOne.addArrangedSubview(switchOne)
        self.hStackOne.addArrangedSubview(stepOne)
        
        self.vStack.addArrangedSubview(sliderOne)
        self.vStack.addArrangedSubview(textField)
        
        self.vStack.addArrangedSubview(hStackTwo)
        self.hStackTwo.addArrangedSubview(aButton)
        self.hStackTwo.addArrangedSubview(aLabel)
        
        self.vStack.addArrangedSubview(segmentControl)
        
        self.vStack.addArrangedSubview(bubbleView)
        
//        bubbleView.backgroundColor = .purple
        
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 40),
            vStack.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            vStack.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 20)
//            vStack.widthAnchor.constraint(equalToConstant: 350),
//            vStack.heightAnchor.constraint(equalToConstant: 400),
//            hStackOne.widthAnchor.constraint(equalTo: self.vStack.widthAnchor),
            
//            bubbleView.topAnchor.constraint(equalTo: vStack.bottomAnchor, constant: 10),
//            bubbleView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        
    }
    
    //MARK: Actions
    @objc func sliderSlide(){
        if sliderOne.value > 0 && sliderOne.value < 1{
            UIView.animate(withDuration: 1, delay:0, options: UIView.AnimationOptions.allowUserInteraction, animations: {
                self.view.backgroundColor = UIColor.white
            })
        }else if sliderOne.value > 1 && sliderOne.value < 2{
            UIView.animate(withDuration: 1, delay:0, options: UIView.AnimationOptions.allowUserInteraction, animations: {
                self.view.backgroundColor = UIColor.yellow
            })
        }else if sliderOne.value > 2 && sliderOne.value < 3{
            UIView.animate(withDuration: 1, delay:0, options: UIView.AnimationOptions.allowUserInteraction, animations: {
                self.view.backgroundColor = UIColor.green
            })
        }else if sliderOne.value > 3 && sliderOne.value < 4{
            UIView.animate(withDuration: 1, delay:0, options: UIView.AnimationOptions.allowUserInteraction, animations: {
                self.view.backgroundColor = UIColor.blue
            })
        }else if sliderOne.value > 4 && sliderOne.value < 5{
            UIView.animate(withDuration: 1, delay:0, options: UIView.AnimationOptions.allowUserInteraction, animations: {
                self.view.backgroundColor = UIColor.purple
            })
        }else if sliderOne.value > 5 && sliderOne.value < 6{
            UIView.animate(withDuration: 1, delay:0, options: UIView.AnimationOptions.allowUserInteraction, animations: {
                self.view.backgroundColor = UIColor.red
            })
        }else if sliderOne.value > 6{
            UIView.animate(withDuration: 1, delay:0, options: UIView.AnimationOptions.allowUserInteraction, animations: {
                self.view.backgroundColor = UIColor.orange
            })
        }
    
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
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.prepare()
        generator.impactOccurred()
        
        let path = Bundle.main.path(forResource: "household_book_put_down_001.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)

        do {
            soundEffect = try AVAudioPlayer(contentsOf: url)
            soundEffect?.play()
        } catch {
            // couldn't load file :(
        }
    }

    
}
