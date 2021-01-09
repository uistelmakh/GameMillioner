

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelF: UILabel!
    @IBOutlet weak var textF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let value = UserDefaults.standard.string(forKey: "textData")
        if value != nil{
            labelF.text = value
        } else {
            labelF.text = "Label"
        }
    }

    @IBAction func pressedButotn(_ sender: Any) {
        labelF.text = textF.text
        UserDefaults.standard.setValue(textF.text, forKey: "textData")
    }
    
}

