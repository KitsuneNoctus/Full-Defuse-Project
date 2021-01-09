//
//  EmotionViewController.swift
//  Defuse2
//
//  Created by Henry Calderon on 1/7/21.
//

import UIKit
import AVFoundation

class EmotionViewController: UIViewController {
    
    var emotionTitle: String = "Emotion"
    var song = ""
    var phrases: [String] = ["Be Calm","Breath","Take Your Time"]

    var backgroundColours = [UIColor(red:0.79, green:0.96, blue:0.80, alpha:1.0), UIColor(red:0.82, green:0.69, blue:0.97, alpha:1.0), UIColor(red:0.75, green:0.94, blue:0.98, alpha:1.0), UIColor(red:0.95, green:0.95, blue:0.87, alpha:1.0), UIColor(red:0.97, green:0.87, blue:0.90, alpha:1.0)]
    var backgroundLoop = 0
    
    var music: AVAudioPlayer?
    
    let phraseLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "System", size: 20)
        return label
    }()

    //MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = emotionTitle
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.isHidden = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createNotes))
        
        animateBackground()
        playBackgroundMusic()
        setup()
    }
    

    //MARK: View Did Disappear
    override func viewDidDisappear(_ animated: Bool) {
        music?.stop()
    }
    
    //MARK: Setup
    func setup(){
        let phraseChosen = phrases.randomElement()
        phraseLabel.text = phraseChosen
        
        self.view.addSubview(phraseLabel)
        NSLayoutConstraint.activate([
            phraseLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            phraseLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
    
    //MARK: Change Background
    func animateBackground(){
        if backgroundLoop < backgroundColours.count - 1 {
            backgroundLoop += 1
        } else {
            backgroundLoop = 0
        }
        UIView.animate(withDuration: 4, delay: 0, options: UIView.AnimationOptions.allowUserInteraction, animations: { () -> Void in
            self.view.backgroundColor =  self.backgroundColours[self.backgroundLoop];
        }) {(Bool) -> Void in
            self.animateBackground();
        }
    }
    
    func playBackgroundMusic(){
        if let path = Bundle.main.path(forResource: song, ofType:nil) {
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
        
    }
    
    //MARK: Create Notes Action
    @objc func createNotes(){
        print("Creating Note")
    }

}
