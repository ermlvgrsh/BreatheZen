import UIKit

extension UIViewController {
    func createStars() {
        let starsCount = 70
        
        for _ in 1...starsCount {
            let starSize = CGFloat.random(in: 1...6)
            
            let x = CGFloat.random(in: 0...self.view.frame.width)
            let y = CGFloat.random(in: 0...self.view.frame.height)
            let starView = UIView(frame: CGRect(x: x, y: y, width: starSize, height: starSize))
            starView.backgroundColor = .white
            starView.layer.cornerRadius = starSize / 2
            self.view.addSubview(starView)
            
            UIView.animate(withDuration: Double.random(in: 0.5...2.0), delay: 0, options: [.autoreverse, .repeat]) {
                starView.alpha = 0.2
            }
        }
    }
}
