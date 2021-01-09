//
//  SettingsViewController.swift
//  registrationApp
//
//  Created by днс on 08.01.2021.
//

import UIKit

var nameTF: String {
    get {
        return UserDefaults.standard.string(forKey: "nameTF_key") ?? ""
    }
    set {
        UserDefaults.standard.set(newValue, forKey: "nameTF_key")
        UserDefaults.standard.synchronize()
    }
}

var nickTF: String {
    get {
        return UserDefaults.standard.string(forKey: "nickTF_key") ?? ""
    }
    set {
        UserDefaults.standard.set(newValue, forKey: "nickTF_key")
        UserDefaults.standard.synchronize()
    }
}

var pickerUser: String {
    get {
        return UserDefaults.standard.string(forKey: "pickerUser_key") ?? ""
    }
    set {
        UserDefaults.standard.set(newValue, forKey: "pickerUser_key")
        UserDefaults.standard.synchronize()
    }
}

class SettingsViewController: UIViewController {

    @IBOutlet weak var backToMainScreen: UIButton!
    
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nickNameTextField: UITextField!
    @IBOutlet weak var slide: UISlider!
    @IBOutlet weak var saveButtonOutlet: UIButton!
    @IBOutlet weak var goOutletButton: UIButton!
    
    var defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //MARK: - Slider
        slide.value = 0.5
        slide.addTarget(self, action: #selector(colorForSlider(_:)), for: .valueChanged)
        
        //MARK: - Picker
        picker.delegate = self
        picker.dataSource = self
    
        //MARK: - Buttons
        backToMainScreen.layer.cornerRadius = 10
        
        saveButtonOutlet.layer.cornerRadius = 10
        
        goOutletButton.layer.cornerRadius = 10
        goOutletButton.layer.borderColor = #colorLiteral(red: 0.3416179653, green: 0.2490181754, blue: 1, alpha: 1)
        goOutletButton.layer.borderWidth = 2
        goOutletButton.backgroundColor = .clear
        
        
        //MARK: - Save Resourers
        
        nameTextField.text = nameTF
        nickNameTextField.text = nickTF
    }
    
    //Buttons - action
    @IBAction func saveActionButton(_ sender: Any) {
        nameTF = nameTextField.text ?? ""
        nickTF = nickNameTextField.text ?? ""
        
    }
    
    @IBAction func goActionButton(_ sender: Any) {
        
        guard let vc = storyboard?.instantiateViewController(identifier: "save") as? SaveViewController else {
            return
        }
        present(vc, animated: true, completion: nil)
    }
    @IBAction func backToMainActionButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @objc func colorForSlider(_ sender: UISlider) {
        if sender.value <= 0.3 {
            view.backgroundColor = .yellow
        } else if sender.value > 0.3 && sender.value <= 0.6 {
            view.backgroundColor = .white
        } else {
            view.backgroundColor = .orange
        }
    }
    

}
//MARK: - Method fors picker
extension SettingsViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let human = ["Мужчина", "Женщина", "Unknown"]
        return human[row]
    }
}

extension SettingsViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
}

extension SettingsViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
