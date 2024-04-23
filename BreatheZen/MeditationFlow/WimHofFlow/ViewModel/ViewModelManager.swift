import Foundation

class ViewModelManager {
    weak var coordinator: WimHofCoordinator?
    weak var delegate: AudioViewModelDelegate?
    let audioVM: AudioViewModel
    
    init(coordinator: WimHofCoordinator, audioVM: AudioViewModel) {
        self.coordinator = coordinator
        self.audioVM = audioVM
    }
    

    func playWimHof() {
        audioVM.play()
        audioVM.delegate = delegate
    }
}
