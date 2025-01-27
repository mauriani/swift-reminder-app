//
//  SplashViewController.swift
//  Remider
//
//  Created by Mauriani Maciel Lima on 24/01/25.
//

import Foundation
import UIKit

class SplashViewController: UIViewController {
    
    let contentView = SplashView()
    
    // ciclo de vida da tela
    override func viewDidLoad() {
        // primeira coisa a ser executada
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        self.view.addSubview(contentView)
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = Colors.primaryRedBase
        
        setupConstraints()
        setupGesture()
    }
    
    // fala onde os elementos estao
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func setupGesture() {
        // armazena o gesto
          let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showLoginBottomSheet))
          self.view.addGestureRecognizer(tapGesture)
      }
      
    
    @objc
        private func showLoginBottomSheet() {
            let loginBottomSheet = LoginBottomSheetViewController()
            loginBottomSheet.modalPresentationStyle = .overCurrentContext
            loginBottomSheet.modalTransitionStyle = .crossDissolve
            self.present(loginBottomSheet, animated: false) {
                loginBottomSheet.animateShow()
            }
        }
    
}
