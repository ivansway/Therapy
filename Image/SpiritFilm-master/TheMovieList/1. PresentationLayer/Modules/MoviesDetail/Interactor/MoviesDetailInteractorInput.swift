//
//  MoviesDetailInteractorInput.swift
//  TheMovieList
//
//  Created by Загид Гусейнов on 29.08.2019.
//  Copyright © 2019 zagid. All rights reserved.
//

import Foundation

protocol MoviesDetailInteractorInput: class {
    func loadGenre()
    func loadCast(movieId: Int)
    func loadVideo(movieId: Int)
}
