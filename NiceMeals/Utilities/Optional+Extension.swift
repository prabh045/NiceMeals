//
//  String+Extension.swift
//  NiceMeals
//
//  Created by Prabhdeep Singh on 15/11/24.
//

import Foundation

extension Optional where Wrapped == String {
    func unwrappedValue() -> String {
        guard let value = self else {
            return "n/a"
        }
        return value
    }
}
