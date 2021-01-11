//
//  HomeExtensionViewController.swift
//  Defuse2
//
//  Created by Henry Calderon on 1/7/21.
//

import UIKit

class HomeExtensionViewController: UIViewController {
    
    let vStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let arButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("AR", for: .normal)
        button.setTitleColor(.systemGray, for: .normal)
        button.addTarget(self, action: #selector(arRoute), for: .touchUpInside)
        return button
    }()

    //MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setup()
    }
    
    func setup(){
        self.view.addSubview(vStack)
        self.vStack.addArrangedSubview(arButton)
        
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: self.view.topAnchor),
            vStack.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            vStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            vStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
    }
    
    //MARK: Actions
    @objc func arRoute(){
        let nextVC = ARLaunchViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }

}
