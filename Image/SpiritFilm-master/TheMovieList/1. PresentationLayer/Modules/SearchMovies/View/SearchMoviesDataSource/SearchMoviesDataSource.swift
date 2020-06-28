//
//  SearchMoviesDataSource.swift
//  TheMovieList
//
//  Created by Загид Гусейнов on 24.08.2019.
//  Copyright © 2019 zagid. All rights reserved.
//

import UIKit
import Kingfisher
import FlexiblePageControl

class SearchMoviesDataSource: NSObject {
    var movies: [Movie] = []
    
    weak var output: SearchMoviesDataSourceOutput!
    
    var tableView: UITableView!
    var searchBar: UISearchBar!
    
    func configure(tableView: UITableView, searchBar: UISearchBar) {
        self.tableView = tableView
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.searchBar = searchBar
        self.searchBar.delegate = self
    }
    
    func show(movies: [Movie]) {
        self.movies = movies
        
        tableView.reloadData()        
    }    
}

extension SearchMoviesDataSource: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SearchMoviesTableViewCell
        let movie = movies[indexPath.row]
        let url = URL(string: "http://image.tmdb.org/t/p/w300\(movie.posterPath ?? "")")
        
        cell.moviesImage.kf.setImage(with: url)
        cell.nameMoviesLabel.text = movie.title
        cell.releaseDate.text = movie.releaseDate
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = movies[indexPath.row]
        
        output.show(movie: movie)
    }
}

extension SearchMoviesDataSource: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let textFieldInsideUISearchBar = searchBar.value(forKey: "searchField") as? UITextField
        textFieldInsideUISearchBar?.textColor = UIColor.white
        
        if searchText.isEmpty {
            movies = []
            tableView.reloadData()
            return
        }
        output.searchMovie(searchText: searchText)
      
    }    
}
