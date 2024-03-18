//
//  Poster.swift
//  Flixster24
//
//  Created by user253148 on 2/28/24.
//

import Foundation
struct MovieSearchResponse: Decodable {
    let results: [movies]
    let resultsCount: Int
}

struct movies: Decodable {
    let artworkUrl100: URL
}
