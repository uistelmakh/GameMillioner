//
//  ViewController.swift
//  training
//
//  Created by днс on 07.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let pickerForData = UIDatePicker()
    let labelForData = UILabel()
    
    let pickerForTime = UIDatePicker()
    let labelForTime = UILabel()
    
    let startButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //labels
        labelForData.frame = CGRect(x: 130, y: 120, width: 160, height: 50)
        labelForData.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        labelForData.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        labelForData.layer.masksToBounds = true
        labelForData.layer.cornerRadius = 10
        labelForData.textAlignment = .center
        
        labelForTime.frame = CGRect(x: 130, y: 430, width: 160, height: 50)
        labelForTime.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        labelForTime.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        labelForTime.layer.masksToBounds = true
        labelForTime.layer.cornerRadius = 10
        labelForTime.textAlignment = .center
        //pickers
        pickerForData.frame = CGRect(x: 130, y: 200, width: 250, height: 125)
        pickerForData.datePickerMode = .date
        pickerForData.locale = Locale(identifier: "ru_Ru")
        
        pickerForTime.frame = CGRect(x: 130, y: 500, width: 250, height: 125)
        pickerForTime.datePickerMode = .time
        pickerForTime.locale = Locale(identifier: "ru_Ru")
        
        // button
        
        startButton.frame = CGRect(x: 160, y: 700, width: 100, height: 50)
        startButton.layer.cornerRadius = 10
        startButton.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        startButton.setTitle("Старт", for: .normal)
        
        //addSubview
        view.addSubview(labelForData)
        view.addSubview(labelForTime)
        view.addSubview(pickerForData)
        view.addSubview(pickerForTime)
        view.addSubview(startButton)
        
        //addTarget
        startButton.addTarget(self, action: #selector(buttonMethod(_:)), for: .touchUpInside)
        pickerForData.addTarget(self, action: #selector(dataChange(_:)), for: .valueChanged)
        pickerForTime.addTarget(self, action: #selector(timeChange(_:)), for: .valueChanged)
        
        
    }

    @objc func buttonMethod(_ : UIButton) {
        let alert = UIAlertController(title: "Внимание", message: "Выбери дату для вывода", preferredStyle: .alert)
        let actionButton = UIAlertAction(title: "Ok", style: .default) { (action) in
            
        }
        alert.addAction(actionButton)
        present(alert, animated: true, completion: nil)
    }
    
    @objc func dataChange(_ data: UIDatePicker) {
        let formate = DateFormatter()
        formate.dateFormat = "dd.MM.yyyy"
        
        let data = formate.string(from: data.date)
        
        labelForData.text = data
    }
    
    @objc func timeChange(_ time: UIDatePicker) {
        let formate = DateFormatter()
        formate.dateFormat = "HH:mm"
        let time = formate.string(from: time.date)
        
        labelForTime.text = time
    }
    
}

