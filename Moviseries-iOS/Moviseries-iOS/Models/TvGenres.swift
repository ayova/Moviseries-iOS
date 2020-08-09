//
//  Genres.swift
//  MoviseriesPieces
//
//  Created by ADMIN on 29/07/2020.
//  Copyright © 2020 ADMIN. All rights reserved.
//

import Foundation

struct TvGenresWrapper: Decodable {
    let genres: [TVGenresList]
}

struct TVGenresList: Decodable {
    let id: Int
    let name: String
}

enum TvGenres: Int, Decodable {
    case ActionAndAdventure = 10759
    case Animation = 16
    case Comedy = 35
    case Crime = 80
    case Documentary = 99
    case Drama = 18
    case Family = 10751
    case Kids = 10762
    case Mystery = 9648
    case News = 10763
    case Reality = 10764
    case ScifiAndFantasy = 10765
    case Soap = 10766
    case Talk = 10767
    case WarAndPolitics = 10768
    case Western = 37
}

extension TvGenres: CustomStringConvertible {
    var description: String {
        switch self {
        case .ActionAndAdventure: return "Action & adventure"
        case .Animation: return "Animation"
        case .Comedy: return "Comedy"
        case .Crime: return "Crime"
        case .Documentary: return "Documentary"
        case .Drama: return "Drama"
        case .Family: return "Family"
        case .Kids: return "Kids"
        case .Mystery: return "Mystery"
        case .News: return "News"
        case .Reality: return "Reality"
        case .ScifiAndFantasy: return "Sci-fi & fantasy"
        case .Soap: return "Soap"
        case .Talk: return "Talk"
        case .WarAndPolitics: return "War & politics"
        case .Western: return "Western"
        }
    }
}


