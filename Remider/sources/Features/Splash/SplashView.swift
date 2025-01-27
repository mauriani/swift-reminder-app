//
//  SplashView.swift
//  Remider
//
//  Created by Mauriani Maciel Lima on 24/01/25.
//

// DIZ A RESPEITO DA PARTE VISUAL
import Foundation
import UIKit

// ADICIONANDO AS PROPRIEDADES

class SplashView: UIView {
    // criando a image e retornando ela
    // LEMBRANDO QUE LET É UMA CONSTANTE (NAO PODE SER ALTERADA)
    
    private let logoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo")
        // onde a imagem vai ficar
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    init(){
        super.init(frame: .zero)
        setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("has not been implemented")
    }
    private func setupUI() {
        self.addSubview(logoImageView)
               
        setupConstraints()
        
    }
    
    // onde ele vai se
    private func setupConstraints(){
        NSLayoutConstraint.activate([
                  logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                  logoImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -Metrics.medium),
        ])
    }
}
