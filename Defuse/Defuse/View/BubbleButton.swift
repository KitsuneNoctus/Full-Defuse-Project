//
//  BubbleButton.swift
//  Defuse
//
//  Created by Henry Calderon on 1/8/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import UIKit
import AVFoundation

class BubbleButton: UIButton {
    var soundEffect: AVAudioPlayer?
    //Mostly with help from an instructor
    override func awakeFromNib() {
        setImage(UIImage(named: "theBubbleImage"), for: .normal)
        self.addTarget(self, action: #selector(popBubble), for: UIControl.Event.touchUpInside)
    }
    
    @objc func popBubble(sender: UIButton){
        //This is slower than just putting the sound in path use ---
        var aSound = "popishSound.mp3"
        let path = Bundle.main.path(forResource: aSound, ofType:nil)!
        // ----^-----
        let url = URL(fileURLWithPath: path)

        do {
            soundEffect = try AVAudioPlayer(contentsOf: url)
            soundEffect?.play()
        } catch {
            // couldn't load file :(
        }
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
