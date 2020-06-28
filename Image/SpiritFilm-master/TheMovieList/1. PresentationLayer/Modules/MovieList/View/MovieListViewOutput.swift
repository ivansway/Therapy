//
//  MovieListViewOutput.swift
//  TheMovieList
//
//  Created by omar on 01/08/2019.
//  Copyright © 2019 zagid. All rights reserved.
//

import Foundation

protocol MovieListViewOutput: class {
    func viewIsReady()
    func buttonIsReady()
    func didSelect(movie: Movie)
}
