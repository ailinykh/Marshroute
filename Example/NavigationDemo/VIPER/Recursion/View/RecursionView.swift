import UIKit

final class RecursionView: UIView {
    private let backgroundImageView = UIImageView(image: UIImage(named: "Recursion.jpg"))
    private let timerButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
    
    // MARK: - Internal
    var defaultContentInsets: UIEdgeInsets = .zero
    
    // MARK: - Init
    init() {
        super.init(frame: .zero)
        
        addSubview(backgroundImageView)
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.layer.masksToBounds = true
        
        addSubview(timerButton)
        timerButton.setTitleColor(.white, for: UIControl.State())
        timerButton.backgroundColor = .blue
        timerButton.addTarget(self, action: #selector(onTimerButtonTap(_:)), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    override func layoutSubviews() {
        backgroundImageView.frame = bounds
        timerButton.frame = CGRect(x: 0, y: defaultContentInsets.top, width: bounds.width, height: 30)
    }
    
    // MARK: - Internal
    func setTimerButtonVisible(_ visible: Bool) {
        timerButton.isHidden = !visible
    }
    
    func setTimerButtonEnabled(_ enabled: Bool) {
        timerButton.isEnabled = enabled
    }
    
    func setTimerButtonTitle(_ title: String) {
        timerButton.setTitle(title, for: UIControl.State())
    }
    
    var onTimerButtonTap: (() -> ())?

    // MARK: - Private
    @objc private func onTimerButtonTap(_ sender: UIButton) {
        onTimerButtonTap?()
    }
}
