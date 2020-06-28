//
//  TopRaitedMoviesDataSource.swift
//  TheMovieList
//
//  Created by Загид Гусейнов on 18.08.2019.
//  Copyright © 2019 zagid. All rights reserved.
//

import UIKit

class TopRaitedMoviesDataSource: NSObject {
    var movies: [Movie] = []
    
    weak var output: TopRaitedMoviesDataSourceOutput!
    
    var collectionView: UICollectionView!
    
    func configure(collectionView: UICollectionView) {
        self.collectionView = collectionView
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    func showTopRaited(movies: [Movie]) {
        self.movies = movies
        
        collectionView.reloadData()
    }
    
}

extension TopRaitedMoviesDataSource: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! TopRaitedMoviesCollectonViewCell
        let movie = movies[indexPath.item]
        let url = URL(string: "http://image.tmdb.org/t/p/w300\(movie.posterPath ?? "")")
        
        cell.movieImageView.kf.setImage(with: url)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = movies[indexPath.item]
        
        output.showRaited(movie: movie)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 2
        let height = collectionView.frame.height
        return CGSize(width: width, height: height)
    }
}

