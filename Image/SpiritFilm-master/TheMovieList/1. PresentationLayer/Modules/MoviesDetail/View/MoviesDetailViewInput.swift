//
//  MoviesDetailViewInput.swift
//  TheMovieList
//
//  Created by Загид Гусейнов on 29.08.2019.
//  Copyright © 2019 zagid. All rights reserved.
//

import Foundation

protocol MoviesDetailViewInput: class {
    func setupInitialState()
    func showMovie(movie: Movie, genres: [Genre])
    func show(cast: MovieCast)
    func show(video: MovieVideo)
    func showVideoPlayer()
    func hightVideoPlayer()
}
