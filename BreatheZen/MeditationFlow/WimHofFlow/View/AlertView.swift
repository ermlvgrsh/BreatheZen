import UIKit

class AlertView: UIView {
    
    weak var delegate: AlertViewDelegate?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        label.textColor = .label
        label.text = "Look\n Before are going to start"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
   private let headphoneLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        label.textColor = .label
        label.text = "Don't forget to put your headphones on\n to get more comfortable"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        label.textColor = .label
        label.numberOfLines = 0
        label.text = "We advise you to turn on\n Don't Disturbe Mode or Airplane Mode"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let airplaneImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "airplane")
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let dontDisturbImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "moon.zzz.fill")
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var doneButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.layer.backgroundColor = UIColor(red: 0.102,
                                               green: 0.106,
                                               blue: 0.133,
                                               alpha: 1).cgColor
        button.layer.cornerRadius = 16
        let titleAttribute: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 17)
        ]
        
        let titleAtributedString = NSAttributedString(string: "Done",
                                                      attributes: titleAttribute)
        button.tintColor = .white
        button.setAttributedTitle(titleAtributedString, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTappedButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        makeContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(titleLabel)
        addSubview(messageLabel)
        addSubview(headphoneLabel)
        addSubview(airplaneImageView)
        addSubview(dontDisturbImageView)
        addSubview(doneButton)
    }
    
    private func makeContraints() {

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(snp.top).offset(10)
            make.leading.equalTo(snp.leading).offset(15)
            make.trailing.equalTo(snp.trailing).offset(-15)
            make.centerX.equalTo(snp.centerX)
        }
        
        messageLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.top).offset(50)
            make.leading.equalTo(snp.leading).offset(15)
            make.trailing.equalTo(snp.trailing).offset(-15)
            make.centerX.equalTo(titleLabel.snp.centerX)
        }
        
        headphoneLabel.snp.makeConstraints { make in
            make.top.equalTo(messageLabel.snp.bottom).offset(20)
            make.leading.equalTo(snp.leading).offset(15)
            make.trailing.equalTo(snp.trailing).offset(-15)
        }
        
        dontDisturbImageView.snp.makeConstraints { make in
            make.leading.equalTo(snp.leading).offset(20)
            make.bottom.equalTo(messageLabel.snp.bottom).offset(-60)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        
        airplaneImageView.snp.makeConstraints { make in
            make.trailing.equalTo(snp.trailing).offset(-20)
            make.bottom.equalTo(messageLabel.snp.bottom).offset(-60)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        
        doneButton.snp.makeConstraints { make in
            make.bottom.equalTo(snp.bottom).offset(-20)
            make.leading.equalTo(snp.leading).offset(20)
            make.trailing.equalTo(snp.trailing).offset(-20)

        }
    }
    
    @objc func didTappedButton() {
        delegate?.didTapDoneButton()
    }
}
