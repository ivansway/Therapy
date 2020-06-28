//
//  SearchMoviesRouter.swift
//  TheMovieList
//
//  Created by Загид Гусейнов on 23.08.2019.
//  Copyright © 2019 zagid. All rights reserved.
//

import Foundation

class SearchMoviesRouter {
    weak var transitionHandler: TransitionHandler!
}

extension SearchMoviesRouter: SearchMoviesRouterInput {
    func presentDetailView(movies: Movie) {
        let vc = MoviesDetailAssembly().view(movie: movies)
        transitionHandler.openModule(vc)
    }
    
    func closeCurrentModule() {
        transitionHandler.dismissView()
    }
    
}
