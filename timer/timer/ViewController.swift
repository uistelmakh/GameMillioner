
import UIKit

class ViewController: UIViewController {

    let label = UILabel()
    let startStopButton = UIButton()
    let dumpButton = UIButton()
    
    var timer = Timer()
    var count = 0
    var timerCount: Bool = false
    
    fileprivate func createLabel() {
        label.frame = CGRect(x: 85, y: 300, width: 300, height: 80)
        label.font = UIFont.systemFont(ofSize: 60)
        label.text = "00:00,00"
        label.textColor = .white
        view.addSubview(label)
    }
    
    fileprivate func createButtons() {
        startStopButton.frame = CGRect(x: 280, y: 500, width: 100, height: 100)
        startStopButton.setTitle("Старт", for: .normal)
        startStopButton.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        startStopButton.layer.cornerRadius = 30
        startStopButton.addTarget(self, action: #selector(startStopMethod(_:)), for: .touchUpInside)
        view.addSubview(startStopButton)
        
        dumpButton.frame = CGRect(x: 40, y: 500, width: 100, height: 100)
        dumpButton.setTitle("Сброс", for: .normal)
        dumpButton.backgroundColor = .gray
        dumpButton.layer.cornerRadius = 30
        dumpButton.addTarget(self, action: #selector(dumpMethod(_:)), for: .touchUpInside)
        view.addSubview(dumpButton)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        createLabel()

        createButtons()
        
    }

    
    // MARK: - Create action buttons
    
    @objc func startStopMethod(_ sender: UIButton) {
        if timerCount {
            
            timerCount = false
            timer.invalidate()
            startStopButton.setTitle("Старт", for: .normal)
            startStopButton.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        } else {
            timerCount = true
            startStopButton.setTitle("Стоп", for: .normal)
            startStopButton.backgroundColor = .red
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        }
    }
    
    @objc func dumpMethod(_ sender: UIButton) {
        count = 0
        timer.invalidate()
        label.text = makeTimeString(hours: 0, minutes: 0, seconds: 0)
        startStopButton.setTitle("Старт", for: .normal)
        startStopButton.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
    }
    
    @objc func timerCounter() {
        count += 1
        let time = secondToHoursMinutesSeconds(seconds: count)
        let timeString = makeTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        label.text = timeString
        
    }
    
    func secondToHoursMinutesSeconds(seconds: Int) -> (Int, Int, Int) {
        return ((seconds / 3600), ((seconds % 3600) / 60), ((seconds % 3600) % 60))
    }
    func makeTimeString(hours: Int, minutes: Int, seconds: Int) -> String {
        var timeString = ""
        timeString += String(format: "%02d", hours)
        timeString += ":"
        timeString += String(format: "%02d", minutes)
        timeString += ":"
        timeString += String(format: "%02d", seconds)
        return timeString
    }
}

