

import UIKit

class ViewController: UIViewController {
    let burgerView = UIView()
    let size: CGFloat = 100
    var blurView = UIVisualEffectView()
   // let blur = UIBlurEffect()

    override func viewDidLoad() {
        super.viewDidLoad()
        addBurgerView()
        
        
    }

    @IBAction func burgerButtonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.burgerView.frame.origin.x = 0
        } completion: { _ in
            self.createBlurView()
        }
    }
    
    private func addBurgerView(){
        self.burgerView.frame = CGRect(x: 0 - self.view.frame.width / 3, y: 0, width: self.view.frame.width / 3, height: self.view.frame.height)
        self.burgerView.backgroundColor = .white
        self.view.addSubview(burgerView)
        
        let redView = UIView(frame: CGRect(x: 0, y: 100, width: burgerView.frame.width, height: 100))
        redView.backgroundColor = .red
        burgerView.addSubview(redView)
        
        let redButton = UIButton(frame: CGRect(x: 0, y: 100, width: burgerView.frame.width, height: 100))
        burgerView.addSubview(redButton)
        redButton.addTarget(self, action: #selector(redButtonPressed), for: .touchUpInside)
        
    }
    
    private func createBlurView(){
        let blurEffect = UIBlurEffect(style: .dark)
        self.blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = CGRect(x: 0 + self.burgerView.frame.width, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        self.view.addSubview(blurView)
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(tap))
        blurView.addGestureRecognizer(recognizer)
        
    }
    
  @objc  private func tap(){
      UIView.animate(withDuration: 0.3) {
          self.burgerView.frame.origin.x = 0 - self.burgerView.frame.width
          self.blurView.removeFromSuperview()
      }
    }
    
    @objc private func redButtonPressed(){
        self.view.backgroundColor = .red
    }
}

