//
//  ViewController.swift
//  arTest
//
//  Created by li jia on 2022/2/25.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    var tableView: UITableView!
    var dataArray: [String] = ["dae","dae + material", "obj", "scn", "custom box","glt"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTableView()
    }
    
    func createTableView() {
        tableView = UITableView(frame: CGRect(x: 0, y: kStatusBarHeight, width: kScreenWidth, height: kScreenHeight - kStatusBarHeight), style: .plain)
        view.addSubview(tableView!)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        44
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = dataArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        let text = dataArray[indexPath.row]
        
        if(text == "dae") {
            let vc = DaeViewController()
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: true, completion: nil)
        } else if(text == "dae + material") {
            let vc = DaeMaterialViewController()
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: true, completion: nil)
        } else if(text == "obj") {
            let vc = ObjViewController()
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: true, completion: nil)
        } else if(text == "scn") {
            let vc = ScnViewController()
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: true, completion: nil)
        } else if(text == "custom box") {
            let vc = BoxViewController()
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: true, completion: nil)
        }else{
            let vc = YZGltViewController()
            vc.modalPresentationStyle = .overFullScreen

            present(vc, animated: true, completion: nil)
        }
    }
}
