//
//  NetworkManager.swift
//  WynkImageSearch
//
//  Created by Aashima Anand on 12/07/20.
//  Copyright © 2020 personal. All rights reserved.
//

import Foundation

enum NetworkResponse:String {
    case success
    case badRequest = "Bad request"
    case failed = "Network request failed."
    case noData = "No data found."
    case unableToDecode = "Some error occured."
    case checkNetwork = "Please check your network connection."
    case pageOutOfIndex
}

enum Result<String>{
    case success
    case failure(NetworkResponse)
}

struct NetworkManager {
    static let pixabayAPIKey = "17433743-cf3153dd56a46e56da96a7d6c"
    let router = Router()
    
    func getImages(page: Int, searchText: String, completion: @escaping (_ images: [Image],_ error: NetworkResponse?)->()){
        router.request(.images(page: page, text: searchText)) { data, response, error in
            
            if error != nil {
                completion([], .checkNetwork)
            }
            
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion([], NetworkResponse.noData)
                        return
                    }
                    do {
                        _ = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
                        let apiResponse = try JSONDecoder().decode(FetchImageResponse.self, from: responseData)
                        if apiResponse.images.isEmpty {
                            completion([], .noData)
                        }else {
                            completion(apiResponse.images,nil)
                        }
                    }catch {
                        completion([], NetworkResponse.unableToDecode)
                    }
                case .failure(let networkFailureError):
                    completion([], networkFailureError)
                }
            }
        }
    }
    
    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String>{
        switch response.statusCode {
        case 200...299: return .success
        case 400: return .failure(.pageOutOfIndex)
        case 401...599: return .failure(NetworkResponse.badRequest)
        default: return .failure(NetworkResponse.failed)
        }
    }
}
