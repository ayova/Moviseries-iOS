//
//  PosterCache.swift
//  Moviseries-iOS
//
//  Created by ADMIN on 20/08/2020.
//  Copyright © 2020 ADMIN. All rights reserved.
//

import Foundation
import UIKit

//class PosterCache {
//    private var cache: [String:UIImage] = [:]
//
//    func savePoster(_ poster: UIImage, withId id: String) {
//        self.cache[id] = poster
//    }
//
//    func retrievePoster(withId id: String) -> UIImage? {
//        return cache[id]
//    }
//
//    func retrieveAllPosters() -> [String:UIImage]? {
//        return cache
//    }
//}

class PosterCache {
    private var cache: [Poster] = []
    
    func savePoster(_ poster: Poster) {
        self.cache.append(poster)
    }
    
    func retrievePoster(withId id: String) -> Poster? {
        // filter poster
        let filteredPoster = cache.filter { poster -> Bool in
            poster.getId() == id
        }
        if let poster = filteredPoster.first {
            return poster // return poster if cached, else, return nil
        } else {
            /// this should always trigger when first opening the app as posters aren't cached at that point
            // print("Poster with id: \(id) not found while filtering cache")
            return nil
        }
    }
    
    func retrieveAllPosters() -> [Poster]? {
        return cache
    }
}

struct Poster {
    private let id: String
    private let image: UIImage
    
    init(id: String, image: UIImage) {
        self.id = id
        self.image = image
    }
    
    func getId() -> String {
        return self.id
    }
    
    func getImage() -> UIImage {
        return self.image
    }
}
