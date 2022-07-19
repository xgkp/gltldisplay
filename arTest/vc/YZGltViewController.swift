//
//  YZGltViewController.swift
//  arTest
//
//  Created by Pro on 2022/7/18.
//

import UIKit
import SceneKit
import UIKit
import GLTFSceneKit

class YZGltViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scnView = SCNView()
        var scene: SCNScene
        do {
            let sceneSource = try GLTFSceneSource(named: "manghe04.glb")
            scene = try sceneSource.scene()
            scnView.scene = scene
            scnView.frame = view.bounds
            let node = scene.rootNode
            let action = SCNAction.rotateBy(x: 0, y: 2, z: 0, duration: 0.8)
            node.runAction(SCNAction.repeatForever(action))
//            node.scale = SCNVector3(0.5, 0.5, 0.5)
            node.geometry?.firstMaterial?.lightingModel = .blinn
            scnView.allowsCameraControl = true
            scnView.autoenablesDefaultLighting = true
            view.addSubview(scnView)
        } catch {
            print("\(error.localizedDescription)")
            return
        }
    }
}
