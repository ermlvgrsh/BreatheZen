import UIKit
extension RootCoordinator {
    func menuScreen(navigationController: UINavigationController, animated: Bool) {
        let menuCoordinator = MenuCoordinator(navigationController: navigationController)
        menuCoordinator.parent = self
        addChild(menuCoordinator)
        menuCoordinator.start()
    }
}
