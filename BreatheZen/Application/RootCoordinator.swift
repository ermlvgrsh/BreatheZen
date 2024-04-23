import UIKit

final class RootCoordinator: NSObject, Coordinator, ParentCoordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let splashCoordinator = SplashCoordinator(navigationController: navigationController)
        splashCoordinator.parent = self
        addChild(splashCoordinator)
        splashCoordinator.start()
    }
    
    func startWimHof() {

    }
}
