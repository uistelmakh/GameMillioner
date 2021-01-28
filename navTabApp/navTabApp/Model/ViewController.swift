
import UIKit

class ViewController: UITabBarController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstVC = UINavigationController(rootViewController: FirstViewController())
        let secondVC = UINavigationController(rootViewController: SecondViewController())
        
        firstVC.title = "Home"
        secondVC.title = "Star"
        
        self.setViewControllers([firstVC, secondVC], animated: true)
        
        guard let items = tabBar.items else {
            return
        }
        
        let images = ["house", "star"]
        
        for x in 0..<items.count {
            items[x].image = UIImage(systemName: images[x])
        }
    }


}

