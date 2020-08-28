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
    var cachedPosters: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let allP: [String:UIImage] = cacheController.retrieveAllPosters()!
        print(allP.keys)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension SearchViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Tapped image at indexPath: \(indexPath.row)")
    }
}

extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cachedPosters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // dequeue
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewItemCell", for: indexPath) as! ListCollectionViewCell
        // configure/set
        cell.configure(image: cachedPosters[indexPath.row])
        // return cell
        return cell
    }
        
}