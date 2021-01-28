//
//  FirstViewController.swift
//  navTabApp
//
//  Created by днс on 27.01.2021.
//

import UIKit

class FirstViewController: UIViewController {
    
    let buttonStart = UIButton()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Button
        buttonStart.frame = CGRect(x: 0, y: 0, width: 200, height: 60)
        buttonStart.center = view.center
        buttonStart.setTitle("Start", for: .normal)
        buttonStart.setTitleColor(.white, for: .normal)
        buttonStart.backgroundColor = .red
        buttonStart.layer.cornerRadius = 8
        buttonStart.addTarget(self, action: #selector(actionButtonMethod(_:)), for: .touchUpInside)
        view.addSubview(buttonStart)
        
        title = "Home"
        view.backgroundColor = .white
    }
    
    @objc func actionButtonMethod(_ sender: Any) {
        let testVC = TestForFirstViewController()
        navigationController?.pushViewController(testVC, animated: true)
    }

}
