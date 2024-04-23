import Foundation
import AVFoundation
protocol AudioViewModelDelegate: AnyObject {
    func updateTime(_ timeString: String)
}

protocol AudioViewModelProtocol: ObservableObject {
    var isPlaying: Bool { get }
    var meditationModel: MeditationModel? { get }
    var audioPlayer: AVAudioPlayer? { get set }
   
    func pause()
    func play()
}

class AudioViewModel: AudioViewModelProtocol {
    
    // MARK: - Properties
    weak var delegate: AudioViewModelDelegate?
    private var timer: Timer?
    var isPlaying: Bool = false
    var meditationModel: MeditationModel?
    var timeString: String = ""
    var audioPlayer: AVAudioPlayer?
    
    // MARK: - init() and methods
 
    private func startTimer() {
        guard timer == nil else { return }
        timer = Timer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        if let timer = timer {
            RunLoop.main.add(timer, forMode: .common)
            timer.fire()
        }
    }
    
    @objc private func updateTime() {
        guard let audioPlayer = audioPlayer else { return }
        let currentTime = Int(audioPlayer.currentTime)
        timeString = timeToString(from: currentTime)
        delegate?.updateTime(timeString)
    }
    
    func play() {
        guard !isPlaying else {
            pause()
            return
        }

        guard meditationModel == nil else { return }
            meditationModel = MeditationModel(fileName: "Method", audioPlayer: audioPlayer ?? AVAudioPlayer(), duration: 0.0)
        
        if let meditationModel = meditationModel {
            if let audioFileURL = Bundle.main.url(forResource: meditationModel.fileName, withExtension: "m4a") {
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf: audioFileURL)
                    audioPlayer!.play()
                    self.isPlaying = true
                    startTimer()
                } catch {
                    print("Couldn't play audio \(error.localizedDescription)")
                }
            }
        }
    }

    
    func pause() {
       if let audioPlayer = audioPlayer {
            audioPlayer.pause()
            isPlaying = false
           timer?.invalidate()
           timer = nil
        }
    }
    
    func timeToString(from seconds: Int) -> String {
        let minutes = seconds / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
