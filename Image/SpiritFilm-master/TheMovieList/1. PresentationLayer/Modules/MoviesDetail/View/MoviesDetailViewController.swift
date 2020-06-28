//
//  MoviesDetailViewController.swift
//  TheMovieList
//
//  Created by Загид Гусейнов on 29.08.2019.
//  Copyright © 2019 zagid. All rights reserved.
//

import Foundation
import UIKit
import YouTubePlayer
import NVActivityIndicatorView

class MoviesDetailViewController: UIViewController {
    
    @IBAction func backButton(_ sender: Any) {
        output.cancelButton()
    }
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var backdropImageView: UIImageView!
    @IBOutlet weak var posterImageVIew: UIImageView!
    @IBOutlet weak var nameMoviesLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var genreMoviesLabel: UILabel!
    @IBOutlet weak var releaseLabel: UILabel!
    @IBOutlet weak var releaseDataMovieLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!    
    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var voteAverageLabel: UILabel!
    @IBOutlet weak var nameDirectorLabel: UILabel!
    @IBOutlet weak var directionLabel: UILabel!
    @IBOutlet weak var castLabel: UILabel!
    @IBOutlet weak var videoView: YouTubePlayerView!    
    @IBOutlet weak var indicatorView: NVActivityIndicatorView!
    @IBOutlet weak var heightVideoView: NSLayoutConstraint!
    
    var output: MoviesDetailViewOutput!
    var moviesDetailDataSource: MoviesDetailDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
}

extension MoviesDetailViewController: MoviesDetailViewInput {
    func showVideoPlayer() {        
    }
    
    func hightVideoPlayer() {
        videoView.isHidden = true
        heightVideoView.constant = 0
    }
    
    func show(video: MovieVideo) {
        moviesDetailDataSource.showMovie(video: video)
        indicatorView.stopAnimating()
    }
    
    func show(cast: MovieCast) {
        moviesDetailDataSource.showCast(cast: cast)
    }
    
    func setupInitialState() {
        moviesDetailDataSource.configure(backdropImageView: backdropImageView, posterImageVIew: posterImageVIew, nameMoviesLabel: nameMoviesLabel, genreMoviesLabel: genreMoviesLabel, releaseDataMovieLabel: releaseDataMovieLabel, descriptionLabel: descriptionLabel,voteAverageLabel: voteAverageLabel, directionLabel: directionLabel, castLabel: castLabel, videoView: videoView)
        indicatorView.startAnimating()
    }

    func showMovie(movie: Movie, genres: [Genre]) {
        moviesDetailDataSource.showMovie(movie: movie, genres: genres)
    }
}

extension MoviesDetailViewController: MovieDetailDataSourceOutput {
    func videoViewIsReady() {
        indicatorView.stopAnimating()
    }    
}


