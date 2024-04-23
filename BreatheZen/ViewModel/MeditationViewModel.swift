import Foundation
import Combine
import AVFoundation

protocol MeditationViewModelProtocol: AnyObject {
    var meditationAudioFile: MeditationModel? { get }
    var timerValue: Int { get }
    var timerValueChanged: PassthroughSubject <Int, Never> { get }
    
    func viewDidLoad(completion: @escaping () -> Void )
    func play()
    func startTimer()
    func pause()

}

class MeditationViewModel: MeditationViewModelProtocol {
    var timerValueChanged = PassthroughSubject<Int, Never>()
    
    var meditationAudioFile: MeditationModel?
    private var _timerValue = 0
    var timerValue: Int {
        return _timerValue
    }
    
    var timer: Timer?
    var timeElapsed: Int = 0
    @Published var audioViewModel: AudioViewModel?
    
    init(audioViewModel: AudioViewModel) {
        self.audioViewModel = AudioViewModel()
    }
    
    func startTimer() {
     
    }
    func pauseTimer() {
        timer?.invalidate()
    }
    
    func viewDidLoad(completion: @escaping () -> Void) {
        guard let audioViewModel = audioViewModel else { return }

        audioViewModel.$isPlaying
            .sink { [weak self] isPlaying in
                if isPlaying {
                    // Вызовите метод, который нужно выполнить при isPlaying == true
                    self?.play()
                } else {
                    // Вызовите метод, который нужно выполнить при isPlaying == false
                    self?.pause()
                }
            }
            .store(in: &audioViewModel.cancellables)
    }
    
    func play() {
        guard let audioViewModel = audioViewModel else { return }
        if !audioViewModel.isPlaying {
            audioViewModel.play()
            startTimer()
        }
    }
    
    func pause() {
        audioViewModel?.pause()
        pauseTimer()
    }
}
