//
//  NewMoviesDataSourceOutput.swift
//  TheMovieList
//
//  Created by Загид Гусейнов on 01.09.2019.
//  Copyright © 2019 zagid. All rights reserved.
//

import Foundation
protocol NewMoviesDataSourceOutput: class {
    func show(movie: Movie)
}
