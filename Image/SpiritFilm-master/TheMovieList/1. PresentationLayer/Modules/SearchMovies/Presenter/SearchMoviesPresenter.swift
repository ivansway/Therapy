//
//  SearchMoviesPresenter.swift
//  TheMovieList
//
//  Created by Загид Гусейнов on 23.08.2019.
//  Copyright © 2019 zagid. All rights reserved.
//

import Foundation

class SearchMoviesPresenter {
    weak var view: SearchMoviesViewInput!
    var interactor: SearchMoviesInteractorInput!
    var router: SearchMoviesRouterInput!
}

extension SearchMoviesPresenter: SearchMoviesViewOutput {
    func didSelect(movie: Movie) {
        router.presentDetailView(movies: movie)
    }
    
    func cancelButton() {
        router.closeCurrentModule()
    }
    
    func searchMovie(name: String) {
        interactor.searchMovies(page: 1, query: name)
    }
    
    func viewIsReady() {
        view.setupInitialState()
    }
}

extension SearchMoviesPresenter: SearchMoviesInteractorOutput {
    func didSearchMovieSuccessfully(movies: [Movie]) {
        let movies = movies.filter { $0.posterPath != nil && $0.backdropPath != nil }
        view.show(movies: movies)
    }    
}
