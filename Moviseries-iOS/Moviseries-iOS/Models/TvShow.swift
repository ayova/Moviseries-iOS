//
//  TvShow.swift
//  Moviseries-iOS
//
//  Created by ADMIN on 09/08/2020.
//  Copyright © 2020 ADMIN. All rights reserved.
//

import Foundation

struct DiscoverTvWrapper : Decodable {
    let results: [TvShow]
}

struct TvShow: Decodable {
    let name, first_air_date, overview, poster_path: String
    let id: Int
    let genre_ids: [Int]
    
    func getGenresArray() -> [String] {
        var arrayOfGenres = [String]()
        genre_ids.forEach { genre_id in
            arrayOfGenres.append(TvGenres(rawValue: genre_id)!.description)
        }
        return arrayOfGenres
    }
}

typealias TvShows = [TvShow]
