import UIKit

class MenuCoordinator: Coordinator, ChildCoordnator {
    var viewControllerRef: UIViewController?

    var navigationController: UINavigationController
    
    weak var parent: ParentCoordinator?
    
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = MenuViewModel(coordinator: self)
        let menuVC = MenuViewController(viewModel: viewModel)
        viewModel.coordinator = self
        viewControllerRef = menuVC
        navigationController.customPushViewController(viewController: menuVC)
        parent?.addChild(self)
     }
    
    func coordinatorDidFinish() {
        navigationController.viewControllers = []
        parent?.childDidFinish(self)
    }
    
    func startWimHof() {
        let wimHofCoordinator = WimHofCoordinator(navigationController: navigationController)
//        wimHofCoordinator.parent = self
//        addChild(wimHofCoordinator)
        wimHofCoordinator.start()
    }
}
