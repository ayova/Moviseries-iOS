//
//  TaskFactory.swift
//  MoviseriesPieces
//
//  Created by ADMIN on 26/07/2020.
//  Copyright © 2020 ADMIN. All rights reserved.
//

import Foundation

class TaskFactory {
    static func task(url: URL, completion: @escaping(Data)->()) -> URLSessionDataTask {
        let session = URLSession(configuration: .ephemeral)
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) {
            (data: Data?, response: URLResponse?, error: Error?) in
            guard error == nil else {
                print(error!)
                return
            }
            guard let data = data else {
                print("Data received is nil")
                return
            }
            DispatchQueue.main.async {
                completion(data)
            }
        }
        return task
    }
}
