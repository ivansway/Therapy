//
//  SearchMoviesDataSourceOutput.swift
//  TheMovieList
//
//  Created by Загид Гусейнов on 25.08.2019.
//  Copyright © 2019 zagid. All rights reserved.
//

import Foundation

protocol SearchMoviesDataSourceOutput: class {
    func searchMovie(searchText: String)
    func show(movie: Movie)
}
