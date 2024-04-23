import UIKit

extension Coordinator {
    
    func popViewController(animated: Bool, useCustomAnimation: Bool) {
        if useCustomAnimation {
            navigationController.customPopViewController()
        } else {
            navigationController.popViewController(animated: animated)
        }
    }
    
    func pushViewController(viewController vc: UIViewController, animated: Bool) {
        navigationController.customPushViewController(viewController: vc)
    }
}
