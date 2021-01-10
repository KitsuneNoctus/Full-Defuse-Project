//
//  NoteViewController.swift
//  Defuse2
//
//  Created by Henry Calderon on 1/8/21.
//

import UIKit

class NoteViewController: UIViewController {
    
    var titleName = "Note"
    var prompt = "Prompt"
    var body: String?
    
    let promptLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let textView: UITextView = {
        let text = UITextView()
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()

    //MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = titleName
        self.view.backgroundColor = .white
        setup()
    }
    
    func setup(){
        self.view.addSubview(promptLabel)
        promptLabel.text = prompt
        self.view.addSubview(textView)
        if let body = body{
            textView.text = body
        }else{
            textView.text = "-Empty-"
        }
        
        NSLayoutConstraint.activate([
            promptLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            promptLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            promptLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 20),
            textView.topAnchor.constraint(equalTo: self.promptLabel.bottomAnchor, constant: 10),
            textView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            textView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            textView.trailingAnchor.constraint(equalTo:self.view.trailingAnchor, constant: -10)
        ])
    }

}
