//
//  ViewController.swift
//  registrationApp
//
//  Created by днс on 08.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var errorLabelForGo: UILabel!
    @IBOutlet weak var goToSettingsOutletButton: UIButton!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        errorLabelForGo.isHidden = true
        passwordTextField.isSecureTextEntry = true
        goToSettingsOutletButton.layer.cornerRadius = 10
        goToSettingsOutletButton.layer.borderWidth = 2
        goToSettingsOutletButton.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
    }
    @IBAction func goToSettingsActionButton(_ sender: Any) {
        
        errorLabelForGo.isHidden = true
        if let email = emailTextField.text, emailTextField.text?.count != 0, let _ = passwordTextField.text, passwordTextField.text?.count != 0, validateEmail(enteredEmail: email) {
            
            guard let vc = storyboard?.instantiateViewController(identifier: "settings") as? SettingsViewController else {return}
            present(vc, animated: true, completion: nil)
            
        } else {
            errorLabelForGo.isHidden = false
            
            
        }
        
    }
    
    
    func validateEmail(enteredEmail:String) -> Bool {
        
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: enteredEmail)
        
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
