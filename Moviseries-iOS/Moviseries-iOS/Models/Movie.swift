//
//  Movie.swift
//  MoviseriesPieces
//
//  Created by ADMIN on 30/07/2020.
//  Copyright © 2020 ADMIN. All rights reserved.
//

import Foundation

struct DiscoverMoviesWrapper : Decodable {
    let results: [Movie]
}

struct Movie: Decodable {
    let title, release_date, overview, poster_path: String
    let id: Int
    let genre_ids: [Int]
    
    func getGenresArray() -> [String] {
        var arrayOfGenres = [String]()
        genre_ids.forEach { genre_id in
            arrayOfGenres.append(MovieGenres(rawValue: genre_id)!.description)
        }
        return arrayOfGenres
    }
}

typealias Movies = [Movie]
