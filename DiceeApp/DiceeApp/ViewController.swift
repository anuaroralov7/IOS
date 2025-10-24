import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!

    let diceArray = [
        #imageLiteral(resourceName: "dice1"),
        #imageLiteral(resourceName: "dice2"),
        #imageLiteral(resourceName: "dice3"),
        #imageLiteral(resourceName: "dice4"),
        #imageLiteral(resourceName: "dice5"),
        #imageLiteral(resourceName: "dice6")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        rollTheDice()
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        rollTheDice()
    }
    
    func rollTheDice() {
        diceImageView1.image = diceArray.randomElement()
        diceImageView2.image = diceArray.randomElement()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            rollTheDice()
        }
    }
}
