//
//  NetworkRequest.swift
//  WynkImageSearch
//
//  Created by Aashima Anand on 12/07/20.
//  Copyright © 2020 personal. All rights reserved.
//

import Foundation

public enum NetworkRequest {
    case images(page:Int, text: String)
   
}

extension NetworkRequest: BaseRequest {
   
    var environmentBaseURL : String {
        return "https://pixabay.com/api/"
    }
    
    var url: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
   
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self {
        case .images(let page, let query):
            return .requestParameters(bodyParameters: nil,
                                      bodyEncoding: .urlEncoding,
                                      urlParameters: ["page":page,
                                                      "key":NetworkManager.pixabayAPIKey,
                                                      "q":query,
                                                      "image_type": "photo"])
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}


