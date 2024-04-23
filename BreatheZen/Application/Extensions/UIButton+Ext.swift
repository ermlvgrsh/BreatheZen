import UIKit

extension UIButton {
    convenience init(title: String, target: Any?, action: Selector) {
        self.init(type: .system)
        
        let attributedText: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 34, weight: .bold)
        ]
        let titleAttributedString = NSAttributedString(
            string: title,
            attributes: attributedText)
        layer.masksToBounds = true
        layer.backgroundColor = UIColor.black.cgColor
        layer.cornerRadius = 16
        setAttributedTitle(titleAttributedString, for: .normal)
        setTitleColor(.white, for: .normal)
        addTarget(target, action: action, for: .touchUpInside)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
