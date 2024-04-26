import UIKit
extension UINavigationController {
    func customPushViewController(viewController vc: UIViewController) {
        addTransition()
        pushViewController(vc, animated: false)
    }
    
    func customPopViewController() {
        addTransition()
        self.popViewController(animated: false)
    }
    
    func customPopToRootViewController() {
        addTransition()
        self.popToRootViewController(animated: false)
    }
    
    func hideNavigationBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func customPopToViewController(viewController vc: UIViewController) {
        addTransition()
        popToViewController(vc, animated: false)
    }
    
    private func addTransition() {
        let transition = CATransition()
        transition.type = .fade
        transition.duration = 0.3
        transition.timingFunction = .init(name: .easeInEaseOut)
        view.layer.add(transition, forKey: kCATransition)
    }
}
