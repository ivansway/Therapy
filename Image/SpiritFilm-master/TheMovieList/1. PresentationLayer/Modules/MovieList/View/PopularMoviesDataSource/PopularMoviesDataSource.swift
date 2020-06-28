//
//  PopularMoviesDataSource.swift
//  TheMovieList
//
//  Created by Загид Гусейнов on 12.08.2019.
//  Copyright © 2019 zagid. All rights reserved.
//

import UIKit
import FlexiblePageControl

class PopularMoviesDataSource: NSObject {
    var movies: [Movie] = []
    
    weak var output: PopularMoviesDataSourceOutput!
    
    var collectionView: UICollectionView!
    
    func configure(collectionView: UICollectionView) {
        self.collectionView = collectionView
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    func showPopular(movies: [Movie]) {
        self.movies = movies
        
        collectionView.reloadData()
    }    
}

extension PopularMoviesDataSource: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! PopularMoviesCollectionViewCell
        let movie = movies[indexPath.item]
        let url = URL(string: "http://image.tmdb.org/t/p/w300\(movie.posterPath ?? "")")
        
        cell.movieImageView.kf.setImage(with: url)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = movies[indexPath.item]
        
        output.showPopular(movie: movie)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 2
        let height = collectionView.frame.height 
        return CGSize(width: width, height: height)
    }
}
