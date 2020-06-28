//
//  MoviesDetailInteractorOutput.swift
//  TheMovieList
//
//  Created by Загид Гусейнов on 29.08.2019.
//  Copyright © 2019 zagid. All rights reserved.
//

import Foundation

protocol MoviesDetailInteractorOutput: class {
    func didLoadGenreSuccessully(genres: [Genre])
    func didLoadCastSuccessfully(cast: MovieCast)
    func didLoadVideoSuccessfully(video: MovieVideo)
}
