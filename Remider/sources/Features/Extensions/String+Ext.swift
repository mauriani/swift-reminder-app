//
//  String+Ext.swift
//  Remider
//
//  Created by Mauriani Maciel Lima on 27/01/25.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
