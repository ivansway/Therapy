//
//  MoviesDetailDataSource.swift
//  TheMovieList
//
//  Created by Загид Гусейнов on 05.09.2019.
//  Copyright © 2019 zagid. All rights reserved.
//

import Kingfisher
import UIKit
import AVKit
import YouTubePlayer

class MoviesDetailDataSource: NSObject {
    var movie: Movie!
    var movieVideo: MovieVideo!
    var genres: [Genre] = []
    var cast: MovieCast!
    
    weak var output: MovieDetailDataSourceOutput!
    
    
    var link = "https://www.youtube.com/watch?v="
    
    var backdropImageView: UIImageView!
    var posterImageVIew: UIImageView!
    var nameMoviesLabel: UILabel!
    var genreMoviesLabel: UILabel!
    var releaseDataMovieLabel: UILabel!
    var descriptionLabel: UILabel!
    var voteAverageLabel: UILabel!
    var directionLabel: UILabel!
    var castLabel: UILabel!
    var videoView: YouTubePlayerView!
    
    func configure(backdropImageView: UIImageView, posterImageVIew: UIImageView, nameMoviesLabel: UILabel, genreMoviesLabel: UILabel, releaseDataMovieLabel: UILabel, descriptionLabel: UILabel, voteAverageLabel: UILabel, directionLabel: UILabel, castLabel: UILabel, videoView: YouTubePlayerView) {
        
        self.backdropImageView = backdropImageView
        self.posterImageVIew = posterImageVIew
        self.nameMoviesLabel = nameMoviesLabel
        self.genreMoviesLabel = genreMoviesLabel
        self.releaseDataMovieLabel = releaseDataMovieLabel
        self.descriptionLabel = descriptionLabel
        self.voteAverageLabel = voteAverageLabel
        self.directionLabel = directionLabel
        self.castLabel = castLabel
        self.videoView = videoView
    }
    
    func showCast(cast: MovieCast) {
        self.cast = cast
        
        let movieCast = cast.cast.prefix(10)
        castLabel.text = movieCast.compactMap { $0.name }.joined(separator: ", ")
        let director = cast.crew.filter { $0.department == "Directing"}.first?.name
        directionLabel.text = director
    }
    
    func showMovie(video: MovieVideo) {
        self.movieVideo = video
        
        guard let videoURL = movieVideo.results.first?.key else {return}
        
        var urlString: String {
            return link + videoURL
        }
        
        if let url = URL(string: urlString) {
            videoView.loadVideoURL(url)
            playerReady(videoView)
        } else {
            videoView.removeFromSuperview()
        }
    }
    
    func showMovie(movie: Movie, genres: [Genre]) {
        self.movie = movie
        self.genres = genres
        reloadData()
    }
    
    func reloadData() {
        let urlBackdrop = URL(string: "http://image.tmdb.org/t/p/w300\(movie.backdropPath ?? "")")
        let urlPoster = URL(string: "http://image.tmdb.org/t/p/w300\(movie.posterPath ?? "")")
        
        backdropImageView.kf.setImage(with: urlBackdrop)
        posterImageVIew.kf.setImage(with: urlPoster)
        nameMoviesLabel.text = movie.title
        voteAverageLabel.text = "\(movie.voteAverage ?? 0)"

        releaseDataMovieLabel.text = movie.releaseDate
        descriptionLabel.text = movie.overview
        
        let genreNames = movie.genreIds.compactMap { genreId in
            return self.genres.filter { $0.id == genreId }.first?.name?.capitalized
        }.joined(separator: ", ")
        
        genreMoviesLabel.text = genreNames    
    }
}


extension MoviesDetailDataSource: YouTubePlayerDelegate {
    func playerReady(_ videoPlayer: YouTubePlayerView) {
        output.videoViewIsReady()
        
    }
}
