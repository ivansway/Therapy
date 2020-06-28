//
//  NewMoviesDataSource.swift
//  TheMovieList
//
//  Created by omar on 03/08/2019.
//  Copyright © 2019 zagid. All rights reserved.
//

import UIKit
import Kingfisher
import FlexiblePageControl

class NewMoviesDataSourse: NSObject {
    var movies: [Movie] = []
    
    weak var output: NewMoviesDataSourceOutput!
    
    var collectionView: UICollectionView!
    var pageControl: FlexiblePageControl!
   
    func configure(collectionView: UICollectionView, pageControl: FlexiblePageControl) {
        self.collectionView = collectionView
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.pageControl = pageControl
    }
    
    func show(movies: [Movie]) {
        self.movies = movies
        self.pageControl.numberOfPages = movies.count
        	
        collectionView.reloadData()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.setProgress(contentOffsetX: scrollView.contentOffset.x, pageWidth: scrollView.bounds.width)
    }    
}

extension NewMoviesDataSourse: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! NewMoviesCollectionViewCell
        let movie = movies[indexPath.item]
        let url = URL(string: "http://image.tmdb.org/t/p/w300\(movie.backdropPath ?? "")")
        
        cell.movieImageView.kf.setImage(with: url)
        cell.nameMoviesLabel.text = movie.title
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = movies[indexPath.item]
        
        output.show(movie: movie)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = collectionView.frame.height
        return CGSize(width: width, height: height)
    }
}
