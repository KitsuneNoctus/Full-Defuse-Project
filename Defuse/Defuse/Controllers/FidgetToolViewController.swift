//
//  FidgetToolViewController.swift
//  Defuse
//
//  Created by Henry Calderon on 1/7/21.
//  Copyright © 2021 Henry Calderon. All rights reserved.
//

import UIKit
import AVFoundation

class FidgetToolViewController: UIViewController {
    
    let switchOne: UISwitch = {
        let swit = UISwitch()
        return swit
    }()
    
    let stepOne: UIStepper = {
        let step = UIStepper()
        return step
    }()
    
    let sliderOne: UISlider = {
        let slider = UISlider()
        return slider
    }()
    
    let segmentControl: UISegmentedControl = {
        let segment = UISegmentedControl()
        return segment
    }()
    
    let aButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    let aLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
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
    }
    
    //MARK: Setup
    func setup(){
        
    }

}
