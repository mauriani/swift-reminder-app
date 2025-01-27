//
//  LoginBottomSheetViewDelegate.swift
//  Remider
//
//  Created by Mauriani Maciel Lima on 27/01/25.
//

import Foundation
import UIKit
protocol LoginBottomSheetViewDelegate: AnyObject {
    func sendLoginData(user: String, password: String)
}
