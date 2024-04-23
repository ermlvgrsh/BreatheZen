import UIKit

final class MenuViewController: UIViewController {
    
    var viewModel: MenuViewModel
    
    init(viewModel: MenuViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let chooseLabel: UILabel = {
        let label = UILabel()
        let attributedText: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 40, weight: .bold),
        ]
        let string = "Choose your meditation"
        let titleAttributedString = NSAttributedString(string: string, attributes: attributedText)
        
        label.attributedText = titleAttributedString
        label.textColor = .white
        
        return label
    }()
    
    private lazy var wimHofButton = UIButton(
        title: "Wim Hof Practice",
        target: self,
        action: #selector(buttonWimHofTapped))
    
    private lazy var hubermanButton = UIButton(
        title: "Huberman Practice",
        target: self,
        action: #selector(buttonHubermanTapped))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    @objc private func buttonHubermanTapped() {
        viewModel.handleMeditationSelection(.huberman)
    }
    
    @objc private func buttonWimHofTapped() {
        viewModel.handleMeditationSelection(.wimHof)
    }
}


extension MenuViewController {
    private func addSubviews() {
        view.addSubview(chooseLabel)
        view.addSubview(wimHofButton)
        view.addSubview(hubermanButton)
    }
    
    func setupView() {
        addSubviews()
        createStars()
        chooseLabel.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(50)
            make.centerX.equalTo(view.snp.centerX)
            make.height.equalTo(90)
        }
        wimHofButton.snp.makeConstraints { make in
            make.top.equalTo(chooseLabel.snp.bottom).offset(60)
            make.leading.equalTo(view.snp.leading).offset(40)
            make.trailing.equalTo(view.snp.trailing).offset(-40)
        }
        hubermanButton.snp.makeConstraints { make in
            make.top.equalTo(wimHofButton.snp.bottom).offset(20)
            make.leading.equalTo(wimHofButton.snp.leading)
            make.trailing.equalTo(wimHofButton.snp.trailing)
        }
    }
}
