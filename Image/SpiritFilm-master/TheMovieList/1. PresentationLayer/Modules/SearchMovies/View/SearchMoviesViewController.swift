//
//  SearchMoviesViewController.swift
//  TheMovieList
//
//  Created by Загид Гусейнов on 23.08.2019.
//  Copyright © 2019 zagid. All rights reserved.
//

import Foundation
import UIKit

class SearchMoviesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBarMovies: UISearchBar!
    @IBAction func cancelButton(_ sender: Any) {
        output.cancelButton()
    }
    
    var output: SearchMoviesViewOutput!
    var searchMoviesDataSource: SearchMoviesDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
}

extension SearchMoviesViewController: SearchMoviesViewInput {
    func show(movies: [Movie]) {
        searchMoviesDataSource.show(movies: movies)
    }
    
    func setupInitialState() {
        searchMoviesDataSource.configure(tableView: tableView, searchBar: searchBarMovies)
    }    
}

extension SearchMoviesViewController: SearchMoviesDataSourceOutput {
    func show(movie: Movie) {
        output.didSelect(movie: movie)
    }
    
    func searchMovie(searchText: String) {
        output.searchMovie(name: searchText)
    }
}
