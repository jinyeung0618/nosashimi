import UIKit

// 입력창 내부 패딩을 위한 extension
extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}

class LoginViewController: UIViewController {

    // HTML의 <input>과 비슷
    let emailTextField = UITextField()
    let passwordTextField = UITextField()

    // HTML의 <button>과 비슷
    let loginButton = UIButton(type: .system)

    let titleLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 0.98, alpha: 1) // 토스 스타일 밝은 회색 배경

        // 이메일 입력창 스타일
        emailTextField.attributedPlaceholder = NSAttributedString(
            string: "이메일",
            attributes: [.foregroundColor: UIColor(white: 0.7, alpha: 1)]
        )
        emailTextField.backgroundColor = UIColor(white: 0.95, alpha: 1)
        emailTextField.layer.cornerRadius = 12
        emailTextField.layer.borderWidth = 0
        emailTextField.font = UIFont.systemFont(ofSize: 18)
        emailTextField.setLeftPaddingPoints(16)
        emailTextField.autocapitalizationType = .none
        emailTextField.keyboardType = .emailAddress

        // 비밀번호 입력창 스타일
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: "비밀번호",
            attributes: [.foregroundColor: UIColor(white: 0.7, alpha: 1)]
        )
        passwordTextField.backgroundColor = UIColor(white: 0.95, alpha: 1)
        passwordTextField.layer.cornerRadius = 12
        passwordTextField.layer.borderWidth = 0
        passwordTextField.font = UIFont.systemFont(ofSize: 18)
        passwordTextField.setLeftPaddingPoints(16)
        passwordTextField.isSecureTextEntry = true
        passwordTextField.autocapitalizationType = .none

        // 로그인 버튼 스타일
        loginButton.setTitle("로그인", for: .normal)
        loginButton.backgroundColor = UIColor(red: 0.13, green: 0.47, blue: 1.0, alpha: 1.0) // 토스 블루
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        loginButton.layer.cornerRadius = 12
        loginButton.layer.masksToBounds = true

        // 뷰에 요소 추가 (HTML의 appendChild와 비슷)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(titleLabel)

        // 버튼 클릭 이벤트 (addEventListener와 비슷)
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)

        // 레이아웃(위치/크기) 설정 (CSS의 flexbox/position과 비슷)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            emailTextField.heightAnchor.constraint(equalToConstant: 54),

            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 28),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 54),

            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40),
            loginButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 56),

            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 48),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32)
        ])

        titleLabel.text = "로그인"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 28)
        titleLabel.textColor = UIColor.black
    }

    @objc func login() {
        // 로그인 로직 (여기에 실제 인증 코드 작성)
        print("로그인 버튼 클릭!")
    }
} 