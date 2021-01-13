//
//  NewNoteViewController.swift
//  Defuse2
//
//  Created by Henry Calderon on 1/8/21.
//

import UIKit
import CoreData

class NewNoteViewController: UIViewController {
    var emotion: String = "Default"
    
    let prompts = ["What has caused you to feel this way?","Think of one time that you felt happy.","How would you talk about this with someone?","Talk to yourself, what would you say if you say yourself like this?","What do you want?","Write a Song","What's the worst joke you have heard?","Tell me about your favorite show.","Descirbe the color blue."]
    
    var coreDataStack = CoreDataStack()
    var note: Note?
    
    //MARK: Items
    let promptLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "New Note"
        label.numberOfLines = 2
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
        text.text = "Enter Note Here..."
        return text
    }()

    //MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "New Note"
        self.navigationController?.navigationBar.isHidden = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(save))
        setup()
    }
    
    //MARK: Setup
    func setup(){
        if emotion == "Default"{
            promptLabel.text = prompts.randomElement()
        }else if emotion == "Anger"{
            promptLabel.text = "What has drawn you towards anger?"
        }else if emotion == "Anxiety"{
            promptLabel.text = "Trace your steps to what has led you here."
        }
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
    @objc func save(){
        if note == nil{
            let newNote = Note(context: coreDataStack.managedContext)
            newNote.title = titleField.text
            newNote.body = bodyField.text
            if promptLabel.text == "New Note"{
                newNote.prompt = "Note"
            }else{
                newNote.prompt = promptLabel.text
            }
            coreDataStack.saveContext()
        }else{
            note?.title = titleField.text
            note?.body = bodyField.text
            coreDataStack.saveContext()
        }
        self.navigationController?.popViewController(animated: true)
    }

}
