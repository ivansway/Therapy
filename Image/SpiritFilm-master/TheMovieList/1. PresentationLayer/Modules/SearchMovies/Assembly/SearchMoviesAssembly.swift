//
//  SearchMoviesAssembly.swift
//  TheMovieList
//
//  Created by Загид Гусейнов on 23.08.2019.
//  Copyright © 2019 zagid. All rights reserved.
//

import Foundation
import UIKit

class SearchMoviesAssembly {
    func view() -> UIViewController {
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SearchMoviesViewController") as! SearchMoviesViewController
        
        let presenter = SearchMoviesPresenter()
        let interactor = SearchMoviesInteractor()
        let router = SearchMoviesRouter()
        let searchMoviesDataSource = SearchMoviesDataSource()
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        view.output = presenter
        view.searchMoviesDataSource = searchMoviesDataSource
        searchMoviesDataSource.output = view
        interactor.output = presenter
        router.transitionHandler = view
        
        interactor.searchMoviesService = ServicesAssembly().moviesService
        
        return view
    }
}
