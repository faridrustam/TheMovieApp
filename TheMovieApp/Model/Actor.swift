//
//  Actor.swift
//  TheMovieApp
//
//  Created by Farid Rustamov on 06.02.25.
//

import Foundation


// MARK: - Actor
struct Actor: Codable {
    let page: Int?
    let results: [ActorResult]?
    let totalPages, totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct ActorResult: Codable, LabelImageCellProtocol {
    var titleText: String {
        name ?? ""
    }
    
    var imageURL: String {
        profilePath ?? ""
    }
    
    let adult: Bool?
    let gender, id: Int?
    let knownForDepartment: KnownForDepartment?
    let name, originalName: String?
    let popularity: Double?
    let profilePath: String?
    let knownFor: [KnownFor]?
    
    enum CodingKeys: String, CodingKey {
        case adult, gender, id
        case knownForDepartment = "known_for_department"
        case name
        case originalName = "original_name"
        case popularity
        case profilePath = "profile_path"
        case knownFor = "known_for"
    }
}

// MARK: - KnownFor
struct KnownFor: Codable, LabelImageCellProtocol {
    var titleText: String {
        if releaseDate == nil {
            return "\(name ?? "") (\(String(firstAirDate?.prefix(4) ?? "")))"
        } else {
            return "\(title ?? "") (\(String(releaseDate?.prefix(4) ?? "")))"
        }
    }
    
    var imageURL: String {
        posterPath ?? ""
    }
    
    let backdropPath: String?
    let id: Int?
    let title, originalTitle, overview, posterPath: String?
    let mediaType: MediaType?
    let adult: Bool?
    let originalLanguage: String?
    let genreIDS: [Int]?
    let popularity: Double?
    let releaseDate: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    let name, originalName, firstAirDate: String?
    let originCountry: [String]?
    
    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case id, title
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case mediaType = "media_type"
        case adult
        case originalLanguage = "original_language"
        case genreIDS = "genre_ids"
        case popularity
        case releaseDate = "release_date"
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case name
        case originalName = "original_name"
        case firstAirDate = "first_air_date"
        case originCountry = "origin_country"
    }
}

enum MediaType: String, Codable {
    case movie = "movie"
    case tv = "tv"
}

enum KnownForDepartment: String, Codable {
    case acting = "Acting"
}
