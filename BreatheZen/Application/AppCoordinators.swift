import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    
    func start()
    
    func popViewController(animated: Bool, useCustomAnimation: Bool)
}

protocol ParentCoordinator: Coordinator {
    var childCoordinators: [Coordinator] { get set }
    
    func addChild(_ child: Coordinator?)
    func childDidFinish(_ child: Coordinator?)
    func startWimHof()
}

protocol ChildCoordnator: Coordinator {
    var viewControllerRef: UIViewController? { get set }
    
    func coordinatorDidFinish()
}
