//
//  LoginBottomSheetViewController.swift
//  Remider
//
//  Created by Mauriani Maciel Lima on 27/01/25.
//

import Foundation
import UIKit

// MVVM-C
class LoginBottomSheetViewController: UIViewController {
    var mainNavigation: UINavigationController?
    let loginView = LoginBottomSheetView()
    let viewModel = LoginBottomSheetViewModel()
    var handleAreaHeight: CGFloat = 50.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.delegate = self
        
        setupUI()
        setupGesture()
        bindViewModel()
    }
    // funcao que garante que a view vai aparecer na tela
    private func setupUI() {
        self.view.addSubview(loginView)
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        // define as constraints do layout, definindo que o LoginBottomSheetView ocupe 505 da tela
        setupConstraints()
    }
    
    private func bindViewModel () {
        viewModel.successResult = {
                [weak self] in
            let viewController = UIViewController()
                        viewController.view.backgroundColor = .red
                        self?.dismiss(animated: false)
            // fazendo a navegacao
                        self?.mainNavigation?.pushViewController(viewController, animated: true)
            }
        }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            loginView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            loginView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        let heightConstraint = loginView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5).isActive = true
    }
    
    
    private func setupGesture() {
        //proxima aula
    }
    
    private func handlePanGesture() {
        //proxima aula
    }
    
    func animateShow(completion: (() -> Void)? = nil) {
        // da update no layout
        self.view.layoutIfNeeded()
        // pega a altyra da pagina de login
        loginView.transform = CGAffineTransform(translationX: 0, y: loginView.frame.height)
        UIView.animate(withDuration: 0.3, animations: {
            self.loginView.transform = .identity
            self.view.layoutIfNeeded()
        }) { _ in
            completion?()
        }
    }
}

// CHAMADO QUANDO O BOTAO DE LOGIN é pressionado
// Faz parte do protocolo LoginBottomSheetViewDelegate e é chamado quando o botão de login é pressionado.
// Recebe os dados de login passa as informacoes ViewModel que faz autenticacao
extension LoginBottomSheetViewController: LoginBottomSheetViewDelegate {
    func sendLoginData(user: String, password: String) {
        viewModel.doAuth(usernameLogin: user, password: password)
    }
}
