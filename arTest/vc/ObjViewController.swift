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
        
        
        let frame =  CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
              //SCNView是显示3D模型对象的视图，继承自UIView
              let scncesView = SCNView(frame: frame)
              scncesView.allowsCameraControl = true
              scncesView.showsStatistics = true
               scncesView.autoenablesDefaultLighting = true
              scncesView.backgroundColor = UIColor.black
              self.view.addSubview(scncesView)
              //从 art.scnassets 加载OBJ
//             let dir = "art.scnassets/capture/5f09505ae2134eac8b4dee35fd024550"
             let scnce = SCNScene(named: "manghe03.obj")
        
             let node = scnce?.rootNode.childNodes.first
             node?.geometry?.firstMaterial?.lightingModel = .blinn
        node?.geometry?.firstMaterial?.diffuse.contents = UIImage.init(named:"头号玩家盲盒贴图01.png")
             scncesView.scene = scnce
        
//        initSceneView()
//
//        setCamera()
//
//        addBackBtn()
    }
    
    func initSceneView() {
        
//        let scene = SCNScene(named: "manghe03.obj")
//
//        scnView.scene = scene
//        scnView.frame = view.bounds
//        scnView.backgroundColor = .black
//        scnView.allowsCameraControl = true
//        view.addSubview(scnView)
//
//        for node in scene!.rootNode.childNodes {
//            print("-----\(node.name ?? "")")
//        }
//
//        if let node = scnView.scene?.rootNode.childNode(withName: "manghe03", recursively: true) {
//            print("account  ==== ")
//            print(node.name)
//            //旋转
////            let action = SCNAction.rotateBy(x: 0, y: 0, z: 2, duration: 0.8);
////            node.runAction(SCNAction.repeatForever(action))
//
//            //缩小
//            node.scale = SCNVector3(0.5, 0.5, 0.5)
//
//            //添加材质
//            node.geometry?.firstMaterial?.lightingModel = .blinn
//
////            public static let phong: SCNMaterial.LightingModel
////
////            public static let blinn: SCNMaterial.LightingModel
////
////            public static let lambert: SCNMaterial.LightingModel
////
////            public static let constant: SCNMaterial.LightingModel
////
////            @available(iOS 10.0, *)
////            public static let physicallyBased: SCNMaterial.LightingModel
////
////            @available(iOS 13.0, *)
////            public static let shadowOnly: SCNMaterial.LightingModel
//
//            node.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "头号玩家盲盒贴图01")
//            scnView.scene?.rootNode.addChildNode(node)
//        }
//
//        scnView.autoenablesDefaultLighting = true
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
