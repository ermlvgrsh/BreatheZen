import UIKit

class AlertView: UIView {
    
    weak var delegate: AlertViewDelegate?
    
    private let titleLabel = UILabel(
        with: "Look\n Before are going to start",
        and: 20)
    
    private let headphoneLabel = UILabel(
        with: "Don't forget to put your headphones on\n to get more comfortable",
        and: 20)
    
    private let messageLabel = UILabel(
        with: "We advise you to turn on\n Don't Disturbe Mode or Airplane Mode",
        and: 20)
  
    private let airplaneImageView = UIImageView(with: "airplane")

    private let dontDisturbImageView = UIImageView(with: "moon.zzz.fill")
    
    private lazy var doneButton = UIButton(for: "Done",
                                           target: self,
                                           action: #selector(didTappedButton))
    
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
            make.top.equalTo(snp.top).offset(40)
            make.leading.equalTo(snp.leading).offset(15)
            make.trailing.equalTo(snp.trailing).offset(-15)
            make.centerX.equalTo(snp.centerX)
        }
        
        messageLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.top).offset(70)
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
