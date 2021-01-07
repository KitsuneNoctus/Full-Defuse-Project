//
//  AnxietyViewController.swift
//  Defuse
//
//  Created by Henry Calderon on 1/8/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import UIKit
import AVFoundation

class AnxietyViewController: UIViewController {
    
    //Timer
    var timer: Timer?
    var timeLeft: Double = 30
    
    //Color and loop
    var backgroundColors = [UIColor()]
    var backgroundLoop = 0
    
    //Music
    var music: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //timeBackgroundChanger()
        
        backgroundColors = [UIColor(red:0.99, green:1.00, blue:0.65, alpha:1.0), UIColor(red:0.93, green:0.76, blue:0.97, alpha:1.0), UIColor(red:0.75, green:0.80, blue:0.94, alpha:1.0), UIColor(red:0.97, green:0.87, blue:0.90, alpha:1.0)]
        backgroundLoop = 0
        self.animateBackgroundColor()
        playBackgroundMusic()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        music?.stop()
    }
    
    func playBackgroundMusic(){
            let path = Bundle.main.path(forResource: "chillSong.mp3", ofType:nil)!
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
    
    func animateBackgroundColor(){
        if backgroundLoop < backgroundColors.count - 1 {
            backgroundLoop += 1
        } else {
            backgroundLoop = 0
        }
        UIView.animate(withDuration: 4, delay: 0, options: UIView.AnimationOptions.allowUserInteraction, animations: { () -> Void in
            self.view.backgroundColor = self.backgroundColors[self.backgroundLoop]
        }) {(Bool) -> Void in
            self.animateBackgroundColor();
        }
    }
    //+====================The Old Stuff=================
    func timeBackgroundChanger(){
        /* Using time to change background colors | No longer in use*/
        var colorVal:Double = 0
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { timerChange in
            colorVal += 0.1
                    if self.timeLeft <= 0{
                        self.timeLeft = 30
                        colorVal = 0
                        colorVal += 0.1
                        colorVal = colorVal * -1
        
                    }
                    self.timeLeft -= 1
            self.view.backgroundColor = UIColor(red: CGFloat(colorVal), green: 1-CGFloat(colorVal), blue: CGFloat(colorVal), alpha: 1)
                 })
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
