//
//  ImageDataModel.swift
//  WynkImageSearch
//
//  Created by Aashima Anand on 12/07/20.
//  Copyright © 2020 personal. All rights reserved.
//

import Foundation

struct FetchImageResponse {
    let total: Int
    let totalHits: Int
    let images: [Image]
}

extension FetchImageResponse: Decodable {
    
    private enum FetchImageResponseCodingKeys: String, CodingKey {
        case total = "total"
        case totalHits = "totalHits"
        case images = "hits"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: FetchImageResponseCodingKeys.self)
        
        total = try container.decode(Int.self, forKey: .total)
        totalHits = try container.decode(Int.self, forKey: .totalHits)
        images = try container.decode([Image].self, forKey: .images)
        
    }
}


struct Image {
    let id: Int
    let pageURL: String
    let type: String
    let tags: String
    let previewURL: String
    let previewWidth: Double
    let previewHeight: Double
    let webformatURL: String
    let webformatWidth: Double
    let webformatHeight: Double
    let largeImageURL: String
    let imageWidth: Double
    let imageHeight: Double
    let imageSize: Double
    let views: Int
    let downloads: Int
    let favorites: Int
    let likes: Int
    let comments: Int
    let userId: Int
    let user: String
    let userImageURL: String
}

extension Image: Decodable {
    
    enum ImageCodingKeys: String, CodingKey {
        case id
        case pageURL = "pageURL"
        case type = "type"
        case tags = "tags"
        case previewURL = "previewURL"
        case previewWidth = "previewWidth"
        case previewHeight = "previewHeight"
        case webformatWidth = "webformatWidth"
        case webformatHeight = "webformatHeight"
        case webformatURL = "webformatURL"
        case largeImageURL = "largeImageURL"
        case imageWidth = "imageWidth"
        case imageHeight = "imageHeight"
        case imageSize = "imageSize"
        case views = "views"
        case downloads = "downloads"
        case favorites = "favorites"
        case likes = "likes"
        case comments = "comments"
        case userId = "user_id"
        case user = "user"
        case userImageURL = "userImageURL"
    }
    
    
    init(from decoder: Decoder) throws {
        let imageContainer = try decoder.container(keyedBy: ImageCodingKeys.self)
        
        id = try imageContainer.decode(Int.self, forKey: .id)
        pageURL = try imageContainer.decode(String.self, forKey: .pageURL)
        type = try imageContainer.decode(String.self, forKey: .type)
        tags = try imageContainer.decode(String.self, forKey: .tags)
        previewURL = try imageContainer.decode(String.self, forKey: .previewURL)
        previewWidth = try imageContainer.decode(Double.self, forKey: .previewWidth)
        previewHeight = try imageContainer.decode(Double.self, forKey: .previewHeight)
        webformatURL = try imageContainer.decode(String.self, forKey: .webformatURL)
        webformatWidth = try imageContainer.decode(Double.self, forKey: .webformatWidth)
        webformatHeight = try imageContainer.decode(Double.self, forKey: .webformatHeight)
        largeImageURL = try imageContainer.decode(String.self, forKey: .largeImageURL)
        imageWidth = try imageContainer.decode(Double.self, forKey: .imageWidth)
        imageHeight = try imageContainer.decode(Double.self, forKey: .imageHeight)
        imageSize = try imageContainer.decode(Double.self, forKey: .imageSize)
        views = try imageContainer.decode(Int.self, forKey: .views)
        downloads = try imageContainer.decode(Int.self, forKey: .downloads)
        favorites = try imageContainer.decode(Int.self, forKey: .favorites)
        likes = try imageContainer.decode(Int.self, forKey: .likes)
        comments = try imageContainer.decode(Int.self, forKey: .comments)
        userId = try imageContainer.decode(Int.self, forKey: .userId)
        user = try imageContainer.decode(String.self, forKey: .user)
        userImageURL = try imageContainer.decode(String.self, forKey: .userImageURL)
      
    }
}
