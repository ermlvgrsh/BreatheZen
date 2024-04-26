import UIKit


extension UIImageView {
    
    convenience init(with imageName: String) {
        self.init()
        self.contentMode = .scaleAspectFit
        self.image = UIImage(systemName: imageName)
        self.tintColor = .black
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
