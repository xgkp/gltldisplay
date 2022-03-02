//
//  ObjViewController.swift
//  arTest
//
//  Created by li jia on 2022/3/1.
//

import Foundation
import SceneKit
import UIKit

class ObjViewController: UIViewController {
    
    let scnView = SCNView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        initSceneView()
        
        setCamera()
        
        addBackBtn()
    }
    
    func initSceneView() {
        
        let scene = SCNScene(named: "Model.obj")
        
        scnView.scene = scene
        scnView.frame = view.bounds
        scnView.backgroundColor = .black
        scnView.allowsCameraControl = true
        view.addSubview(scnView)
        
        for node in scene!.rootNode.childNodes {
            print("-----\(node.name ?? "")")
        }
    
        if let node = scnView.scene?.rootNode.childNode(withName: "_material_1", recursively: true) {

            //旋转
            let action = SCNAction.rotateBy(x: 0, y: 0, z: 2, duration: 0.8);
            node.runAction(SCNAction.repeatForever(action))
            
            //缩小
            node.scale = SCNVector3(0.5, 0.5, 0.5)

            //添加材质
            node.geometry?.firstMaterial?.lightingModel = .blinn
            node.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "Model_0.jpg")
            scnView.scene?.rootNode.addChildNode(node)
        }
    }
    
    func setCamera() {
        let camera = SCNCamera()
        let cameraNode = SCNNode()
        cameraNode.camera = camera
        cameraNode.position = SCNVector3(0, 0, 100)
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
