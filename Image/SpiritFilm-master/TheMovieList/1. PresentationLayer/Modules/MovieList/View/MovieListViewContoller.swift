//
//  MovieListViewContoller.swift
//  TheMovieList
//
//  Created by omar on 01/08/2019.
//  Copyright © 2019 zagid. All rights reserved.
//

import UIKit
import FlexiblePageControl

class MovieListViewController: UIViewController {
    @IBOutlet weak var newMoviesCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: FlexiblePageControl!    
    @IBOutlet weak var popularMoviesCollectionView: UICollectionView!
    @IBOutlet weak var topRaitedMoviesCollectionView: UICollectionView!
    @IBOutlet weak var popularMoviesLabel: UILabel!
    @IBOutlet weak var topRaitedMoviesLabel: UILabel!
    @IBAction func searchButton(_ sender: Any) {
        output.buttonIsReady()
    }
    
    
    var output: MovieListViewOutput!
    var newMoviesDataSource: NewMoviesDataSourse!
    var popularMoviesDataSource: PopularMoviesDataSource!
    var topRaitedMoviesDataSource: TopRaitedMoviesDataSource!

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }    
}

extension MovieListViewController: MovieListViewInput {
    func showPopular(movies: [Movie]) {
        popularMoviesDataSource.showPopular(movies: movies)
    }
    
    func showTopRaited(movies: [Movie]) {
        topRaitedMoviesDataSource.showTopRaited(movies: movies)
    }
    
    func setupInitialState() {
        newMoviesDataSource.configure(collectionView: newMoviesCollectionView, pageControl: pageControl)
        popularMoviesDataSource.configure(collectionView: popularMoviesCollectionView)
        topRaitedMoviesDataSource.configure(collectionView: topRaitedMoviesCollectionView)
    }
    
    func show(movies: [Movie]) {
        newMoviesDataSource.show(movies: movies)        
    }
}

extension MovieListViewController: NewMoviesDataSourceOutput {
    func show(movie: Movie) {
        output.didSelect(movie: movie)
    }    
}

extension MovieListViewController: PopularMoviesDataSourceOutput {
    func showPopular(movie: Movie) {
        output.didSelect(movie: movie)
    }
}

extension MovieListViewController: TopRaitedMoviesDataSourceOutput {
    func showRaited(movie: Movie) {
        output.didSelect(movie: movie)
    }
}
