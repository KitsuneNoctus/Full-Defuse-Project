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
    
    @IBOutlet weak var sceneView: ARSCNView!
    @IBOutlet weak var launchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        sceneView.delegate = self
        sceneView.showsStatistics = true
        sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin]
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
    
}
