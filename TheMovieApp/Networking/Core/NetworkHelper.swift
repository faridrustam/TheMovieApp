//
//  NetworkHelper.swift
//  TheMovieApp
//
//  Created by Farid Rustamov on 01.02.25.
//

import Foundation
import Alamofire

class NetworkHelper {
    static let shared = NetworkHelper()
    
    let baseURL = "https://api.themoviedb.org/3"
    let header: HTTPHeaders = ["Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxZmEwZjI5YTg4ZWE1MTIwMjhkYzI3ZDU0Zjg0MWI4ZSIsIm5iZiI6MTczODMzNjM4My45NDIwMDAyLCJzdWIiOiI2NzljZTg3ZjgyMmU3ZDMyZjdiZGY3NTAiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.Jttye7DaQ2b4GyduSnaakS0zpkgxDwKY_CL2B3bvEWQ"]
}
