//
//  ARLaunchViewController.swift
//  Defuse2
//
//  Created by Henry Calderon on 1/10/21.
//

import UIKit
import SceneKit
import ARKit

class ARLaunchViewController: UIViewController, ARSCNViewDelegate {
    
    let phrases = ["You are Loved","Relax","This is You"]
    let colors = [UIColor.black,UIColor.blue,UIColor.purple]
    var text: SCNText!
    
//    let text = SCNText(string: phrases.randomElement(), extrusionDepth: 1)
//
//    let material = SCNMaterial()
//    material.diffuse.contents = colors.randomElement()
    
//    text.materials = [material]
    
    @IBOutlet weak var sceneView: ARSCNView!
    @IBOutlet weak var launchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        sceneView.delegate = self
        sceneView.showsStatistics = true
//        sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin]
        
        showItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration =
            ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
    }
    
    @IBAction func launch(_ sender: UIButton) {
        print("Working")
    }
    
    func showItem(){
        self.text = SCNText(string: phrases.randomElement(), extrusionDepth: 1)
        
        let material = SCNMaterial()
        material.diffuse.contents = colors.randomElement()
        
        text.materials = [material]
        
        let node = SCNNode()
        node.position = SCNVector3(0, 0.1, -0.5)
        node.scale = SCNVector3(0.01, 0.01, 0.01)
        node.geometry = text
        node.name = "shape"
        sceneView.scene.rootNode.addChildNode(node)
    }
    
}
