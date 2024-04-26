import UIKit

final class SplashCoordinator: ChildCoordnator {
    var viewControllerRef: UIViewController?
    var parent: RootCoordinator?
    
    var navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func coordinatorDidFinish() {
        parent?.childDidFinish(self)
    }

    func start() {
        let splashViewModel = SplashViewModel(coordinator: self)
        let splashVC = SplashViewController(viewModel: splashViewModel)
        navigationController.customPushViewController(viewController: splashVC)
    }
    
    func startMenuScreen() {
        let menuCoordinator = MenuCoordinator(navigationController: navigationController)
        parent?.addChild(menuCoordinator)
        menuCoordinator.start()
    }
    
}
