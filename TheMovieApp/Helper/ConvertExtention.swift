//
//  ConvertExtention.swift
//  TheMovieApp
//
//  Created by Farid Rustamov on 07.02.25.
//

import Foundation

extension MovieResult {
    init(from cast: Cast) {
        self.id = cast.id
        self.title = cast.title
        self.originalTitle = cast.originalTitle
        self.overview = cast.overview
        self.posterPath = cast.posterPath
        self.releaseDate = cast.releaseDate
        self.adult = cast.adult
        self.backdropPath = cast.backdropPath
        self.genreIDS = cast.genreIDS
        self.originalLanguage = cast.originalLanguage
        self.popularity = cast.popularity
        self.video = cast.video
        self.voteAverage = cast.voteAverage
        self.voteCount = cast.voteCount
    }
}

extension MovieResult {
    init(id: Int?, title: String?, posterPath: String?) {
        self.adult = nil
        self.backdropPath = nil
        self.genreIDS = nil
        self.id = id
        self.originalLanguage = nil
        self.originalTitle = nil
        self.overview = nil
        self.popularity = nil
        self.posterPath = posterPath
        self.releaseDate = nil
        self.title = title
        self.video = nil
        self.voteAverage = nil
        self.voteCount = nil
    }
}
