import UIKit


extension UILabel {
    convenience init(with text: String, and size: CGFloat) {
        self.init()
        self.font = UIFont.systemFont(ofSize: size, weight: .bold)
        self.text = text
        self.textColor = .label
        self.numberOfLines = 0
        self.textAlignment = .center
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
