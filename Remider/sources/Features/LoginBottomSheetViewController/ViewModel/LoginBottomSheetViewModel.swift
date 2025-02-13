//
//  LoginBottomSheetViewController.swift
//  Remider
//
//  Created by Mauriani Maciel Lima on 28/01/25.
//

import Foundation
import Firebase

class LoginBottomSheetViewModel {
    var successResult: (() -> Void)?

    func doAuth(usernameLogin: String, password: String) {
        print(usernameLogin)
        
        Auth.auth().signIn(withEmail: usernameLogin, password: password) {
                    [weak self] authResult, error in
                    if let error = error {
                        print("Autenticação não teve sucesso \(error)")
                    } else {
                        self?.successResult?()
                    }
                }
        
    }
}
