//
//  SaveViewController.swift
//  registrationApp
//
//  Created by днс on 08.01.2021.
//

import UIKit

class SaveViewController: UIViewController {

    @IBOutlet weak var saveUserDatat: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        saveUserDatat.layer.masksToBounds = true
        saveUserDatat.layer.cornerRadius = 10
        
    }
    

    

}
