import Foundation


class SplashViewModel {
    weak var coordinator: SplashCoordinator?
    
    init(coordinator: SplashCoordinator?) {
        self.coordinator = coordinator
    }
    
    func showSplashScreen() {
        coordinator?.startMenuScreen()
    }
    
}
