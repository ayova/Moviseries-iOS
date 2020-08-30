//
//  SearchViewController.swift
//  Moviseries-iOS
//
//  Created by ADMIN on 28/08/2020.
//  Copyright © 2020 ADMIN. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    let cacheController = PosterCache()
    var posterList: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cachedPosters = cacheController.retrieveAllPosters()!
        for poster in cachedPosters {
            posterList.append(poster.getImage())
        }
    }
}

extension SearchViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Tapped image at indexPath: \(indexPath.row)")
    }
}

extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posterList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // dequeue
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewItemCell", for: indexPath) as! ListCollectionViewCell
        // configure/set
        cell.configure(image: posterList[indexPath.row])
        // return cell
        return cell
    }
        
}
