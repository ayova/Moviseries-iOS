//
//  PosterCache.swift
//  Moviseries-iOS
//
//  Created by ADMIN on 20/08/2020.
//  Copyright © 2020 ADMIN. All rights reserved.
//

import Foundation
import UIKit

class PosterCache {
    private var cache: [String:UIImage] = [:]
    
    func savePoster(_ poster: UIImage, withId id: String) {
        self.cache[id] = poster
    }
    
    func retrievePoster(withId id: String) -> UIImage? {
        return cache[id]
    }
}
