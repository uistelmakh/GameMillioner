

import UIKit

class TestForFirstViewController: UIViewController {

    let imageView = UIImageView()
    let backButton = UIButton()
    let nextButton = UIButton()
    let label = UILabel()
    var slides = 1
    
    let images = [UIImage(named: "mask.png"), UIImage(named: "spacex.png"), UIImage(named: "teslaMask.png")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createButtons()
        createLabel()
        
        imageView.image = images[0]
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 280)
        imageView.center = view.center
        imageView.contentMode  = .scaleToFill
        view.addSubview(imageView)
        
        view.backgroundColor = .white
    }
    
    fileprivate func createButtons() {
        
        backButton.frame = CGRect(x: 40, y: 650, width: 150, height: 50)
        backButton.layer.cornerRadius = 8
        backButton.setTitle("back", for: .normal)
        backButton.setTitleColor(.white, for: .normal)
        backButton.backgroundColor = #colorLiteral(red: 0.3416179653, green: 0.2490181754, blue: 1, alpha: 1)
        backButton.addTarget(self, action: #selector(backMethodButton(_:)), for: .touchUpInside)
        view.addSubview(backButton)
        
        nextButton.frame = CGRect(x: 230, y: 650, width: 150, height: 50)
        nextButton.layer.cornerRadius = 8
        nextButton.setTitle("next", for: .normal)
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.backgroundColor = #colorLiteral(red: 0.3416179653, green: 0.2490181754, blue: 1, alpha: 1)
        nextButton.addTarget(self, action: #selector(nextButtonMethod(_:)), for: .touchUpInside)
        view.addSubview(nextButton)
        
    }
    
    fileprivate func createLabel() {
        label.frame = CGRect(x: 80, y: 100, width: 300, height: 50)
        label.text = "Биография Илона Маска 1 / 3"
        label.textColor = .black
        view.addSubview(label)
    }
    
    @objc func backMethodButton(_ sender: UIButton) {
        
        slides -= 1
        label.text = "Биография Илона Маска \(slides) / 3"
        
        if slides > -1 && slides < 1{
            
            label.text = "Биография Илона Маска \(slides + 1) / 3"
            
            backButton.isEnabled = false
            
            let alert = UIAlertController(title: "Внимание", message: "Биография Илона Маска впереди, нажмите ок", preferredStyle:  .alert)
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            
            alert.addAction(action)
            
            present(alert, animated: true, completion: nil)
        }
        if slides == 1 {
            imageView.image = images[0]
        } else if slides == 2 {
            imageView.image = images[1]
        } else if slides == 3 {
            imageView.image = images[2]
        }
        
    }

    @objc func nextButtonMethod(_ sender: UIButton) {
        slides += 1
        label.text = "Биография Илона Маска \(slides) / 3"
        if slides > 3 && slides < 5{
            
            label.text = "Биография Илона Маска \(slides - 1) / 3"
            
            nextButton.isEnabled = false
            
            let alert = UIAlertController(title: "Внимание", message: "Биография Илона Маска закончилась, нажмите ок", preferredStyle:  .alert)
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            
            alert.addAction(action)
            
            present(alert, animated: true, completion: nil)
        }
        
        if slides == 1 {
            imageView.image = images[0]
        } else if slides == 2 {
            imageView.image = images[1]
        } else if slides == 3 {
            imageView.image = images[2]
        }
        
    }
}
