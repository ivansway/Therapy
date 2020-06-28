//
//  MovieListViewInput.swift
//  TheMovieList
//
//  Created by omar on 01/08/2019.
//  Copyright © 2019 zagid. All rights reserved.
//

import Foundation

protocol MovieListViewInput: class {
    func show(movies: [Movie])
    func setupInitialState()
    func showPopular(movies: [Movie])
    func showTopRaited(movies: [Movie])
}
