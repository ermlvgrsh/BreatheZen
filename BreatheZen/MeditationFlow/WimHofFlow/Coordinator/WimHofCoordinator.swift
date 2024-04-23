import UIKit

final class WimHofCoordinator: ChildCoordnator {
    var viewControllerRef: UIViewController?
    var parent: RootCoordinator?
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func coordinatorDidFinish() {

    }
    
    func start() {
        let audioVM = AudioViewModel()
        let viewModelManager = ViewModelManager(coordinator: self, audioVM: audioVM)
        let wimHofVC = WimHofViewController(viewModel: viewModelManager)
        navigationController.customPushViewController(viewController: wimHofVC)
    }
    
    func menuScreen() {
        parent?.menuScreen(navigationController: navigationController, animated: true)
    }
    
}
