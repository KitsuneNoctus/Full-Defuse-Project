//
//  AngerViewController.swift
//  Defuse
//
//  Created by Henry Calderon on 1/8/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import UIKit
import AVFoundation

class AngerViewController: UIViewController {
    //This is for the anger view
    //Used the stuff in this link for all of the color an background code
    //https://stackoverflow.com/questions/32287237/gradually-change-background-color-in-swift
    var backgroundColours = [UIColor()]
    var backgroundLoop = 0
    
    var music: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundColours = [UIColor(red:0.79, green:0.96, blue:0.80, alpha:1.0), UIColor(red:0.82, green:0.69, blue:0.97, alpha:1.0), UIColor(red:0.75, green:0.94, blue:0.98, alpha:1.0), UIColor(red:0.95, green:0.95, blue:0.87, alpha:1.0), UIColor(red:0.97, green:0.87, blue:0.90, alpha:1.0)]
        backgroundLoop = 0
        self.animateBackgroundColour()
        playBackgroundMusic()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        music?.stop()
    }
    
    func playBackgroundMusic(){
        let path = Bundle.main.path(forResource: "calmUkulele.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)

        do {
            music = try AVAudioPlayer(contentsOf: url)
            music?.numberOfLoops = -1
            music?.play()
//            music?.numberOfLoops = -1
        } catch {
            // couldn't load file :(
        }
    }
    
    func animateBackgroundColour () {
        if backgroundLoop < backgroundColours.count - 1 {
            backgroundLoop += 1
        } else {
            backgroundLoop = 0
        }
        UIView.animate(withDuration: 4, delay: 0, options: UIView.AnimationOptions.allowUserInteraction, animations: { () -> Void in
                self.view.backgroundColor =  self.backgroundColours[self.backgroundLoop];
            }) {(Bool) -> Void in
                self.animateBackgroundColour();
            }
    }


}
