//
//  NetworkController.swift
//  MoviseriesPieces
//
//  Created by ADMIN on 26/07/2020.
//  Copyright © 2020 ADMIN. All rights reserved.
//

import Foundation

enum RootPath: String {
    case baseURL = "https://api.themoviedb.org/3/"
    case imagesURL = "https://image.tmdb.org/t/p/w500/"
}

enum TMDBEndpoints: String {
    case movieGenresEndpoint = "genre/movie/list"
    case tvGenresEndpoint = "genre/tv/list"
    case discoverMovieEndpoint = "discover/movie"
    case discoverTvEndpoint = "discover/tv"
    case searchMovieEndpoint = "search/movie"
    case searchTvEndpoint = "search/tv"
}

enum NetworkError: Error {
    case NetworkError
}

let api_key = "d8fd16e131618860a80cb75f720d694c"

class NetworkController {
    
    func fetchGenres(from endpoint: TMDBEndpoints, completion: @escaping (Data)->()) {
        switch endpoint {
        case .movieGenresEndpoint, .tvGenresEndpoint:
            var urlComponents = URLComponents(string: RootPath.baseURL.rawValue + endpoint.rawValue)
            urlComponents?.queryItems = [ URLQueryItem(name: "api_key", value: api_key) ]
            let requestUrl = (urlComponents?.url!)!
            let genresTask = TaskFactory.task(url: requestUrl, completion: completion)
            genresTask.resume()
            return
        default:
            print("Calling wrong function!")
            return
        }
    }
    
    func fetchContent(from contentType: TMDBEndpoints, completion: @escaping (Data)->()) {
        switch contentType {
        case .discoverMovieEndpoint, .discoverTvEndpoint:
            var urlComponents = URLComponents(string: RootPath.baseURL.rawValue + contentType.rawValue)
            urlComponents?.queryItems = [ URLQueryItem(name: "api_key", value: api_key) ]
            let requestUrl = (urlComponents?.url!)!
            let contentFetchingTask = TaskFactory.task(url: requestUrl, completion: completion)
            contentFetchingTask.resume()
            return
        default:
            print("Calling wrong function: \(contentType)")
            return
        }
    }
}
