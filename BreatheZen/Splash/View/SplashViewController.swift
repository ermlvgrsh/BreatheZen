import UIKit
import SnapKit

protocol AlertViewDelegate: AnyObject {
    func didTapDoneButton()
}

final class SplashViewController: UIViewController {
    var splashViewModel: SplashViewModel
    
    init(viewModel: SplashViewModel) {
        self.splashViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Futura Medium", size: 64)
        label.textColor = .white
        label.text = "Breathe Zen"
        label.shadowOffset = CGSize(width: 3, height: 3)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var enterButton: UIButton = {
       let button = UIButton()
        let string = "Tap here to find zen"
        let attributedText: [NSAttributedString.Key: Any] =
        [
            .font: UIFont(name: "Gill Sans", size: 32) ?? UIFont.systemFont(ofSize: 32),
            .foregroundColor: UIColor.white
        ]
        let titleAttributedString = NSAttributedString(string: string, attributes: attributedText)
        button.setAttributedTitle(titleAttributedString, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self,
                         action: #selector(transitToMenu),
                         for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let alertView: AlertView = {
        let view = AlertView()
        view.layer.masksToBounds = true
        view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner]
        view.layer.cornerRadius = 40
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    
    @objc private func transitToMenu() {
        animateAlert()
        alertView.delegate = self

    }
    
    private func animateAlert() {
        alertView.isHidden = false
        let viewCenter = view.center.y - alertView.frame.height / 2
        UIView.animate(withDuration: 2.0) {
            self.alertView.frame.origin.y = viewCenter
         }
    }
    
    private func setupView() {
        view.addSubview(titleLabel)
        view.addSubview(enterButton)
        view.addSubview(alertView)
        alertView.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading).offset(20)
            make.trailing.equalTo(view.snp.trailing).offset(-20)
            make.bottom.equalTo(view.snp.top)
            make.height.equalTo(400)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(150)
            make.centerX.equalToSuperview()
        }
        enterButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.snp.bottom).offset(-300)
            make.width.equalTo(view.snp.width)
            make.height.equalTo(titleLabel.snp.height)
            make.centerX.equalToSuperview()
        }
        createStars()
    }
}

extension SplashViewController: AlertViewDelegate {
    func didTapDoneButton() {
        splashViewModel.showSplashScreen()
    }
}
