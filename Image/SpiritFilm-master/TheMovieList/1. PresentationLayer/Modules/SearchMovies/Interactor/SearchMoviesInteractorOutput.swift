//
//  SearchMoviesInteractorOutput.swift
//  TheMovieList
//
//  Created by Загид Гусейнов on 23.08.2019.
//  Copyright © 2019 zagid. All rights reserved.
//

import Foundation

protocol SearchMoviesInteractorOutput: class  {
    func didSearchMovieSuccessfully(movies: [Movie])
}
