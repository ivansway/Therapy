//
//  MovieListRouter.swift
//  TheMovieList
//
//  Created by omar on 01/08/2019.
//  Copyright © 2019 zagid. All rights reserved.
//

import Foundation
import UIKit

class MovieListRouter {
    weak var transitionHandler: TransitionHandler!
}

extension MovieListRouter: MovieListRouterInput {
    func presentDetailView(movies: Movie) {
        let vc = MoviesDetailAssembly().view(movie: movies)
        transitionHandler.openModule(vc)
        
    }
    
    func presentSearchView() {
        let vc = SearchMoviesAssembly().view()
        transitionHandler.openModule(vc)
    }
    
}
