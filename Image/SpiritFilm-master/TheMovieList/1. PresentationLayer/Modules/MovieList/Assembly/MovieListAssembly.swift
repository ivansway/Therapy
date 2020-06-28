//
//  MovieListAssembly.swift
//  TheMovieList
//
//  Created by omar on 01/08/2019.
//  Copyright © 2019 zagid. All rights reserved.
//

import Foundation
import UIKit

class MovieListAssembly {
    func view() -> UINavigationController {
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieListViewController") as! MovieListViewController
        let nc = UINavigationController(rootViewController: view)
        
        let presenter = MovieListPresenter()
        let intaractor = MovieListInteractor()
        let router = MovieListRouter()
        let newMoviesDataSource = NewMoviesDataSourse()
        let popularMoviesDataSource = PopularMoviesDataSource()
        let topRaitedMoviesDataSource = TopRaitedMoviesDataSource()
        
        
        presenter.view = view
        presenter.interactor = intaractor
        presenter.router = router
        
        view.output = presenter
        view.newMoviesDataSource = newMoviesDataSource
        view.popularMoviesDataSource = popularMoviesDataSource
        view.topRaitedMoviesDataSource = topRaitedMoviesDataSource
        intaractor.output = presenter
        router.transitionHandler = view
        newMoviesDataSource.output = view
        popularMoviesDataSource.output = view
        topRaitedMoviesDataSource.output = view
        
        intaractor.moviesService = ServicesAssembly().moviesService
        
        return nc
    }
}
