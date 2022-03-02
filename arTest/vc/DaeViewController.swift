//
//  DaeViewController.swift
//  arTest
//
//  Created by li jia on 2022/3/1.
//

import Foundation
import UIKit
import SceneKit

class DaeViewController: UIViewController {
    
    var scnView = SCNView()
    var count: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        initSceneView()
        
        addKeShengDAE()
        
        setCamera()
        
        addBackBtn()
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
    
    func initSceneView() {
        scnView.frame = view.bounds
        scnView.backgroundColor = .black
        scnView.allowsCameraControl = true
        scnView.scene = SCNScene()
        view.addSubview(scnView)
    }
    
    func setCamera() {
        let camera = SCNCamera()
        let cameraNode = SCNNode()
        cameraNode.camera = camera
        cameraNode.position = SCNVector3(-7, 5, 30)
        scnView.scene?.rootNode.addChildNode(cameraNode)
    }
 
    func addKeShengDAE() {
        
        guard let url = Bundle.main.url(forResource: "man", withExtension: "dae") else {
            fatalError("baby_groot.scn not exit.")
        }
        
        guard let customNode = SCNReferenceNode(url: url) else {
            fatalError("load baby_groot error.")
        }
        
        customNode.scale = SCNVector3(0.001, 0.001, 0.001)
        customNode.load()
        scnView.scene?.rootNode.addChildNode(customNode)
        
        
        showNodes(node: customNode)
    }
    
    func showNodes(node: SCNNode) {
        if node.childNodes.count > 0 {
            for n in node.childNodes {
                count += 1
                print("---\(count)---\(node.name ?? "[]")----\(node.childNodes.count)--------\(n.name ?? "")")
                if n.childNodes.count > 0 {
                    showNodes(node: n)
                }
            }
        }
    }
}
