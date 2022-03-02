//
//  BoxViewController.swift
//  arTest
//
//  Created by li jia on 2022/3/1.
//

import Foundation
import UIKit
import SceneKit

class BoxViewController: UIViewController {
    
    var scnView = SCNView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        initSceneView()
        
        addBox()
        
        setCamera()
        
        addBackBtn()
    }
    
    func initSceneView() {
        scnView.frame = view.bounds
        scnView.backgroundColor = .black
        scnView.allowsCameraControl = true
        scnView.scene = SCNScene()
        view.addSubview(scnView)
    }
    
    func addBox() {
        let box1 = SCNBox.init(width: 10, height: 10, length: 10, chamferRadius: 0)
        box1.firstMaterial?.diffuse.contents = UIColor.blue
        let boxNode1 = SCNNode()
        boxNode1.geometry = box1
        scnView.scene?.rootNode.addChildNode(boxNode1)
        
        let action = SCNAction.rotateBy(x: 0, y: 2, z: 2, duration: 0.8);
        boxNode1.runAction(SCNAction.repeatForever(action))
    }
    
    func setCamera() {
        let camera = SCNCamera()
        let cameraNode = SCNNode()
        cameraNode.camera = camera
        cameraNode.position = SCNVector3(0, 0, 30)
        scnView.scene?.rootNode.addChildNode(cameraNode)
    }
    
    func addBackBtn() {
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 100, y: kStatusBarHeight, width: 100, height: 44);
        btn.backgroundColor = .white
        btn.setTitleColor(.black, for: .normal)
        btn.setTitle("返回", for: .normal)
        view.addSubview(btn)
        btn.addTarget(self, action: #selector(back), for: .touchUpInside)
    }
    
    @objc func back() {
        dismiss(animated: true, completion: nil)
    }
}

