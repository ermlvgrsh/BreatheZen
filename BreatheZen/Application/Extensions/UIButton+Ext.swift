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
    
    convenience init(for doneButton: String, textColor: UIColor = .white, target: Any?, action: Selector) {
        self.init()
        self.layer.backgroundColor = UIColor(red: 0.102,
                                               green: 0.106,
                                               blue: 0.133,
                                             alpha: 0.5).cgColor
        self.layer.cornerRadius = 16
        let titleAttribute: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 17),
            .foregroundColor: textColor
        ]
        
        let titleAtributedString = NSAttributedString(string: doneButton,
                                                      attributes: titleAttribute)
        self.tintColor = .white
        self.setAttributedTitle(titleAtributedString, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addTarget(target, action: action, for: .touchUpInside)
    }
}
