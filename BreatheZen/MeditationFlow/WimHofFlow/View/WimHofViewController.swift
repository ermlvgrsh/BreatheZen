import UIKit
final class WimHofViewController: UIViewController {
    
    private var isPlaying: Bool = false
    
    private let timerLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 40, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var viewModel: ViewModelManager?
    init(viewModel: ViewModelManager) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var pushButton: UIButton = {
       let button = UIButton()
        let string = "Press Play"
        
        let attributedText: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 34, weight: .bold)
        ]
        let titleAttributedString = NSAttributedString(
            string: string,
            attributes: attributedText)
        button.setAttributedTitle(titleAttributedString,
                                  for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self,
                         action: #selector(buttonPlayTapped),
                         for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setupView()
    }
    
    @objc private func buttonPlayTapped() {
        timerLabel.isHidden = false
        viewModel?.playWimHof()
    }
    
    private func setupView() {
        view.backgroundColor = .black
        view.addSubview(pushButton)
        view.addSubview(timerLabel)
        viewModel?.delegate = self
        createStars()
        pushButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        timerLabel.snp.makeConstraints { make in
            make.bottom.equalTo(pushButton.snp.top).offset(-30)
            make.centerX.equalTo(view.snp.centerX)
            make.height.equalTo(50)
        }
    }
}

extension WimHofViewController: AudioViewModelDelegate {
    func updateTime(_ timeString: String) {
        DispatchQueue.main.async {
            self.timerLabel.text = timeString
        }
    }
}
