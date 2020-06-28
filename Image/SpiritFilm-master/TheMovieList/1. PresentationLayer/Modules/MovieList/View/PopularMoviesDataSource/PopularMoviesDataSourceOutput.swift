//
//  PopularMoviesDataSourceOutput.swift
//  TheMovieList
//
//  Created by Загид Гусейнов on 22.09.2019.
//  Copyright © 2019 zagid. All rights reserved.
//

import Foundation

protocol PopularMoviesDataSourceOutput: class {
    func showPopular(movie: Movie)
}
