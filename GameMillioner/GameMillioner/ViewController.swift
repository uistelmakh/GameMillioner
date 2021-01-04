//
//  ViewController.swift
//  GameMillioner
//
//  Created by днс on 04.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var countCorrectAnswers = 0
    
    /*
       Outlets
     */
     
    
    //buttons
    
    @IBOutlet weak var startOutletButton: UIButton!
    @IBOutlet weak var firstQuastionOutletButton: UIButton!
    @IBOutlet weak var secondQuastionOutletButton: UIButton!
    @IBOutlet weak var thirdQuastionOutletButton: UIButton!
    @IBOutlet weak var endGameOutletButton: UIButton!
    
    //labels
    
    @IBOutlet weak var previewUnderStart: UILabel!
    @IBOutlet weak var resultGameOver: UILabel!
    
    // cornerButton
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        startOutletButton.roundButton()
        firstQuastionOutletButton.roundButton()
        secondQuastionOutletButton.roundButton()
        thirdQuastionOutletButton.roundButton()
        endGameOutletButton.roundButton()
        firstQuastionOutletButton.isHidden = true
        secondQuastionOutletButton.isHidden = true
        thirdQuastionOutletButton.isHidden = true
        endGameOutletButton.isHidden = true
        resultGameOver.isHidden = true
        resultGameOver.layer.cornerRadius = 10
        resultGameOver.backgroundColor = .clear
        resultGameOver.layer.borderWidth = 2
        resultGameOver.layer.borderColor = UIColor.white.cgColor
    }

    /*
       Actions
     */
    @IBAction func startActionButton(_ sender: Any) {
        firstQuastionOutletButton.isHidden = false
        secondQuastionOutletButton.isHidden = false
        thirdQuastionOutletButton.isHidden = false
        startOutletButton.isHidden = true
        
        let alert = UIAlertController(title: "Привет! Я Моника 🤵🏼‍♀️", message: "Введи свое имя и забери миллион 💸", preferredStyle: .alert)
        let action = UIAlertAction(title: "Хорошо", style: .default) { (action) in
            let text = alert.textFields?.first
            self.previewUnderStart.text = ("Привет, \(text?.text?.capitalized ?? "") ответь на 3 вопроса и забери приз 💰")
        }
        alert.addTextField(configurationHandler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func firstQuastionActionButton(_ sender: Any) {
        methodForQuestions(title: "Первый вопрос 🤓", message: "Какая столица у России?", style: .actionSheet, firstAnswer: "Москва", secondAnswer: "Санкт-Петербург", correctAnswer: "Москва")
        
    }
    @IBAction func secondQuastionActionButton(_ sender: Any) {
        methodForQuestions(title: "Второй вопрос 🤓", message: "Сколько в России регионов?", style: .actionSheet, firstAnswer: "85 регионов", secondAnswer: "50 регионов", correctAnswer: "85 регионов")
    }
    @IBAction func thirdQuastionActionButton(_ sender: Any) {
        methodForQuestions(title: "Третий вопрос 🤓", message: "Территория России составляет...", style: .actionSheet, firstAnswer: "17 125 191 км^2", secondAnswer: "12 152 701 км^2", correctAnswer: "17 125 191 км^2")
        endGameOutletButton.isHidden = false
    }
    @IBAction func endGameActionButton(_ sender: Any) {
        resultGameOver.isHidden = false
        resultGameOver.text = ("Вы набрали \(countCorrectAnswers) очка")
    }
    
    //func for questions
    
    func methodForQuestions(title: String, message: String, style: UIAlertController.Style, firstAnswer: String, secondAnswer: String, correctAnswer: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: style)
        let firstActionAlert = UIAlertAction(title: firstAnswer, style: .default) { (action) in
            self.checkAnswer(correctAnswer: correctAnswer, answer: firstAnswer)
        }
        let secondActionAlert = UIAlertAction(title: secondAnswer, style: .default) { (action) in
            self.checkAnswer(correctAnswer: correctAnswer, answer: secondAnswer)
        }
        alertVC.addAction(firstActionAlert)
        alertVC.addAction(secondActionAlert)
        self.present(alertVC, animated: true, completion: nil)
    }
    
    // func check correct answer
    func checkAnswer(correctAnswer: String, answer: String) {
        if answer == correctAnswer {
            
            let alert = UIAlertController(title: "Правильно ✅", message: "Вы ответили верно", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok 😁", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            self.countCorrectAnswers += 1
        } else {
            
            let alert = UIAlertController(title: "Неправильно ⛔️", message: "Вы ответили неверно", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok 🥺", style: .destructive, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
}

extension UIButton {
    func roundButton() {
        self.layer.cornerRadius = 10
    }
}
