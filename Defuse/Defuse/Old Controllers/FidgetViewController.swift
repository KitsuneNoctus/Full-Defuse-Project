//
//  FidgetViewController.swift
//  Defuse
//
//  Created by Henry Calderon on 1/6/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import UIKit
import AVFoundation

class FidgetViewController: UIViewController {
    /* Fidget button screen with multiple buttons to press and play with */
    //First set of buttons
    @IBOutlet weak var switchOne: UISwitch!
    @IBOutlet weak var stepperOne: UIStepper!
    @IBOutlet weak var sliderOne: UISlider!
//    https://www.youtube.com/watch?v=A6vxDDAUj2o
    @IBOutlet weak var viewSegmentControl: UISegmentedControl!
    //Second Set (Plus stuff)
    @IBOutlet weak var aButton: UIButton!
    @IBOutlet weak var aButtonLabel: UILabel!
    
    //IBOutlest for screens views--------------
    @IBOutlet weak var BubbleView: UIView!
    @IBOutlet weak var keyView: UIView!
    
    //Text field stuff-----------
    let aLabelWordList = ["They're","There","Their","your","you're","bear","bare","angle","angel"]
    
//    var lastStepperOneValue: Int?
    //To use for sound effects with buttons---
    var soundEffect: AVAudioPlayer?
    var redValue = CGFloat.random(in:0..<1)
    
//========================================================
    override func viewDidLoad() {
        super.viewDidLoad()
//        var lastStepperOneValue = Int(stepperOne.value)

        // Do any additional setup after loading the view.
    }
    @IBAction func useSliderOne(_ sender: UISlider) {
        
//        var sliderOneValue = CGFloat(sender.value)
//        var redValue = CGFloat.random(in:0..<1)
        view.backgroundColor = UIColor(red: redValue, green: 1-CGFloat(sender.value), blue: CGFloat(sender.value), alpha: 1)
    }
    @IBAction func switchValueChanged(_ sender: UISwitch) {
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
    @IBAction func useStepperOne(_ sender: UIStepper) {
        let path = Bundle.main.path(forResource: "clickSound.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)

        do {
            soundEffect = try AVAudioPlayer(contentsOf: url)
            soundEffect?.play()
        } catch {
            // couldn't load file :(
        }
//        if Int(stepperOne.value) < lastStepperOneValue{
//            print("Hi")
//        } else if Int(stepperOne.value) > lastStepperOneValue{
//            print("Bye")
//        }
    }
    @IBAction func aButtonPressed(_ sender: Any) {
        let path = Bundle.main.path(forResource: "crackSoud.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)

        do {
            soundEffect = try AVAudioPlayer(contentsOf: url)
            soundEffect?.play()
        } catch {
            // couldn't load file :(
        }
        let textBit = aLabelWordList[Int.random(in: 0..<aLabelWordList.count)]
        aButtonLabel.text = textBit
    }
    @IBAction func viewSegmentControlUsed(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            BubbleView.alpha = 1
            keyView.alpha = 0
        }else{
            BubbleView.alpha = 0
            keyView.alpha = 1
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
