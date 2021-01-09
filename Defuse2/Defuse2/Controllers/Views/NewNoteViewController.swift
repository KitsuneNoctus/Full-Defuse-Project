//
//  NewNoteViewController.swift
//  Defuse2
//
//  Created by Henry Calderon on 1/8/21.
//

import UIKit
import CoreData

class NewNoteViewController: UIViewController {
    
    let promptLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "New Note"
        return label
    }()
    
    let titleField: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = "Title Here..."
        return text
    }()
    
    let bodyField: UITextView = {
        let text = UITextView()
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()

    //MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "New Note"
        self.navigationController?.navigationBar.isHidden = false
        setup()
    }
    
    //MARK: Setup
    func setup(){
        self.view.addSubview(promptLabel)
        self.view.addSubview(titleField)
        self.view.addSubview(bodyField)
        
        NSLayoutConstraint.activate([
            promptLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            promptLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            promptLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 20),
            titleField.topAnchor.constraint(equalTo: self.promptLabel.bottomAnchor, constant: 10),
            titleField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            titleField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 20),
            bodyField.topAnchor.constraint(equalTo: self.titleField.bottomAnchor, constant: 10),
            bodyField.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            bodyField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            bodyField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 20),
        ])
        
    }
    
    //MARK: Core Data Save
    func save(){
        
    }

}
