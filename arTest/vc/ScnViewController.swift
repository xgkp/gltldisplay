//
//  ScnViewController.swift
//  arTest
//
//  Created by li jia on 2022/3/1.
//

import Foundation
import UIKit
import SceneKit

class ScnViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        initSceneView()
        
        addBackBtn()
    }
    
    func initSceneView() {
        
        let scene = SCNScene(named: "baby_groot1.scn")
        let scnView = SCNView()
        scnView.scene = scene
        scnView.frame = view.bounds
        scnView.backgroundColor = .red
        scnView.allowsCameraControl = true
        view.addSubview(scnView)
        
        for node in scene!.rootNode.childNodes {
            print("-----\(node.name ?? "")")
        }
        
        if let node = scnView.scene?.rootNode.childNode(withName: "_4_grootgotg2baby_1_0_0", recursively: true) {

            //缩小
            node.scale = SCNVector3(0.5, 0.5, 0.5)

        }
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
