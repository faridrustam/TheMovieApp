//
//  AuthVC.swift
//  TheMovieApp
//
//  Created by Farid Rustamov on 19.02.25.
//

import UIKit

class AuthVC: UIViewController {
    
    //MARK: UI Elements
    
    private lazy var email: UITextField = {
        let l = UITextField()
        l.textColor = .black
        l.placeholder = "Enter your email"
        l.borderStyle = .roundedRect
        l.font = .systemFont(ofSize: 18, weight: .regular)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    private lazy var password: UITextField = {
        let l = UITextField()
        l.textColor = .black
        l.borderStyle = .roundedRect
        l.placeholder = "Enter your password"
        l.isSecureTextEntry = true
        l.font = .systemFont(ofSize: 18, weight: .regular)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    private lazy var submitButton: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("LOGIN", for: .normal)
        b.setTitleColor(.white, for: .normal)
        b.backgroundColor = .blue
        b.translatesAutoresizingMaskIntoConstraints = false
        b.layer.masksToBounds = true
        b.addTarget(self, action: #selector(configureFireBase), for: .touchUpInside)
        
        return b
    }()
    
    private lazy var logoutButton: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("LOGOUT", for: .normal)
        b.setTitleColor(.white, for: .normal)
        b.backgroundColor = .blue
        b.translatesAutoresizingMaskIntoConstraints = false
        b.layer.masksToBounds = true
        b.addTarget(self, action: #selector(configureSignOut), for: .touchUpInside)
        
        return b
    }()
    
    private lazy var stackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [email, password, submitButton, logoutButton])
        sv.axis = .vertical
        sv.distribution = .fillEqually
        sv.spacing = 20
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    //MARK: - Life cycle

    let viewModel = AuthVM()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureConstraints()
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
    }
    
    private func configureConstraints() {
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12)
            ])
    }
    
    @objc private func configureFireBase() {
        viewModel.getAuth(email: email.text ?? "", password: password.text ?? "")
    }
    
    @objc private func configureSignOut() {
        viewModel.signOut()
    }
}
