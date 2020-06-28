//
//  MoviesDetailAssembly.swift
//  TheMovieList
//
//  Created by Загид Гусейнов on 01.09.2019.
//  Copyright © 2019 zagid. All rights reserved.
//

import Foundation
import UIKit

class MoviesDetailAssembly {
    func view(movie: Movie) -> UINavigationController {
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MoviesDetailViewController") as! MoviesDetailViewController
        let nc = UINavigationController(rootViewController: view)
        
        let presenter = MoviesDetailPresenter()
        let interactor = MoviesDetailInteractor()
        let router = MoviesDetailRouter()
        let moviesDetailDataSource = MoviesDetailDataSource()
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        presenter.movie = movie
        
        view.output = presenter
        view.moviesDetailDataSource = moviesDetailDataSource
        interactor.output = presenter
        router.transitionHandler = view
        moviesDetailDataSource.output = view
        
        interactor.genreService = ServicesAssembly().genreService
        interactor.movieCastService = ServicesAssembly().movieCastService
        interactor.movieVideoService = ServicesAssembly().movieVideoService
        
        return nc
    }
    
}
