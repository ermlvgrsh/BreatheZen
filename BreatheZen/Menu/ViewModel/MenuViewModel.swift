import Foundation

class MenuViewModel {
    var didSelectMeditation: ((MeditationType) -> Void)?
    var coordinator: MenuCoordinator
    init(coordinator: MenuCoordinator) {
        self.coordinator = coordinator
    }
    
    
    func selectedMeditation(_ type: MeditationType) {
        didSelectMeditation?(type)
    }
    
    func handleMeditationSelection(_ type: MeditationType) {
        switch type {
        case.wimHof:
            coordinator.startWimHof()
         case .huberman:
            print("HUBERMAN")
        }
    }
}
