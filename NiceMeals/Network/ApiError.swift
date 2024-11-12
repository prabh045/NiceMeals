//
//  ApiError.swift
//  NiceMeals
//
//  Created by Prabhdeep Singh on 05/08/24.
//

import Foundation

enum ApiError: Error {
    case invalidUrl
    case invalidResponse
    case invalidStatusCode
    case invalidModel
    case unknownError
}
