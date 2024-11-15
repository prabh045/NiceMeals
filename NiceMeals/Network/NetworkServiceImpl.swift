//
//  NetworkServiceApi.swift
//  NiceMeals
//
//  Created by Prabhdeep Singh on 03/08/24.
//

import Foundation
import OSLog

struct NetworkServiceImpl: NetworkServiceRepo {
    func fetchData<T: Decodable>(for url: String) async -> Result<T, ApiError> {
        print("fetching for url \(url)")
        guard let url = URL(string: url) else {
            return .failure(.invalidUrl)
        }
        do {
            let (data, resp) = try await URLSession.shared.data(from: url)
            guard let response = resp as? HTTPURLResponse else {
                return .failure(.invalidResponse)
            }
            guard response.statusCode == 200 else {
                return .failure(.invalidStatusCode)
            }
            let decodedModel = try JSONDecoder().decode(T.self, from: data)
            return .success(decodedModel)
        } catch (let error) {
            Logger().log(level: .error, "Error in getting data \(error)")
            return .failure(.invalidModel)
        }
    }
}
