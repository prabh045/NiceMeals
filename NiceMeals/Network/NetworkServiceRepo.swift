//
//  NetworkServiceRepo.swift
//  NiceMeals
//
//  Created by Prabhdeep Singh on 11/08/24.
//

import Foundation

protocol NetworkServiceRepo {
    func fetchData<T: Decodable>(for url: String) async -> Result<T, ApiError>
}
