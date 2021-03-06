//
//  HomeViewController.swift
//  Moviseries-iOS
//
//  Created by ADMIN on 09/08/2020.
//  Copyright © 2020 ADMIN. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: Local variables
    let networkController = NetworkController()
    let posterCacheController = PosterCache()
    var tvShowsGathered: TvShows? {
        didSet {
            homeTableView.reloadData()
        }
    }
    var moviesGathered: Movies? {
        didSet {
            homeTableView.reloadData()
        }
    }
    
    // MARK: IBOutlets
    @IBOutlet weak var homeTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeTableView.dataSource = self
        fetchContent(from: .discoverMovieEndpoint)
        fetchContent(from: .discoverTvEndpoint)
        
        
    }
    
    // MARK: Fetch content
    private func fetchContent(from endpoint: TMDBEndpoints) {
        switch endpoint {
        case .discoverMovieEndpoint:
            networkController.fetchContent(from: endpoint) { data in
                guard !data.isEmpty else { print("No data received (empty)"); return }
                do {
                    let decodedContent = try JSONDecoder().decode(DiscoverMoviesWrapper.self, from: data)
                    self.moviesGathered = decodedContent.results
                }
                catch {
                    print(error)
                }
            }
        case .discoverTvEndpoint:
            networkController.fetchContent(from: endpoint) { data in
                guard !data.isEmpty else { print("No data received (empty)"); return }
                do {
                    let decodedContent = try JSONDecoder().decode(DiscoverTvWrapper.self, from: data)
                    self.tvShowsGathered = decodedContent.results
                }
                catch {
                    print(error)
                }
            }
        default:
            print("Error - Wrong endpoint passed in! (other than discover movies or tv!)")
        }
    }
    
    // MARK: Fetch posters and set the cell's title + image
    private func setCellElements(posterUrl: String, completion: @escaping(UIImage)->()) {
        if let poster = posterCacheController.retrievePoster(withId: posterUrl) {
            completion(poster)
        } else {
            networkController.fetchPoster(url: posterUrl) { [weak self] posterData in
                if let poster = UIImage(data: posterData) {
                    self?.posterCacheController.savePoster(poster, withId: posterUrl)
                    completion(poster)
                }
            }
        }
    }
}

// MARK: TableView DataSource

/* movies  = section 1 */
/* tvShows = section 2 */

extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        var sections = 0
        if moviesGathered  != nil { sections += 1 }
        if tvShowsGathered != nil { sections += 1 }
        return sections
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Movies"
        case 1:
            return "Tv shows"
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: // movies section
            return moviesGathered?.count ?? 0
        case 1: // tv shows section
            return tvShowsGathered?.count ?? 0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "HomeTableCell", for: indexPath)
        switch indexPath.section {
        case 0: // movies section
            if let configurableCell = cell as? HomeTableViewCell {
                if let movie = moviesGathered?[indexPath.row] {
                    // configure cell with the appropriate movie details
                    setCellElements(posterUrl: movie.poster_path) { poster in
                        configurableCell.configure(title: movie.title, poster: poster)
                    }
                    
                }
            }
        case 1: // tv shows section
            if let configurableCell = cell as? HomeTableViewCell {
                if let tvShow = tvShowsGathered?[indexPath.row] {
                    // configure cell using the appropriate tv show details
                    setCellElements(posterUrl: tvShow.poster_path) { poster in
                        configurableCell.configure(title: tvShow.name, poster: poster)
                    }
                }
            }
        default:
            fatalError()
        }
        return cell
    }
}


