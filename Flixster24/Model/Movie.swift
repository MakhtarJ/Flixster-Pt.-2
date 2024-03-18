//
//  File.swift
//  Flixster24
//
//

import Foundation
struct MovieResponse: Decodable{
    let results: [Movie]
}
struct Movie: Decodable {
    let id: Int
    let title: String
    let poster_path: String?
    let overview: String
    let backdrop_path: String?
    let popularity: Double
    let vote_average: Double
    let vote_count: Int
    var posterURL: URL? {URL(string: "https://image.tmdb.org/t/p/w500\(poster_path ?? "")")!}
    var backDropURL: URL? {URL(string: "https://image.tmdb.org/t/p/w500\(backdrop_path ?? "")")!}
}

/*extension Movie {

    static var mockMovies: [Movie] = [
        Movie(title: "Wonka", poster_path: URL(string:"https://image.tmdb.org/t/p/original/qhb1qOilapbapxWQn9jtRCMwXJF.jpg")!, overview: "Willy Wonka – chock-full of ideas and determined to change the world one delectable bite at a time – is proof that the best things in life begin with a dream, and if you’re lucky enough to meet Willy Wonka, anything is possible.", backdrop_path: URL(string:"https://image.tmdb.org/t/p/original/yOm993lsJyPmBodlYjgpPwBjXP9.jpg")!, popularity: 3205.442, vote_average: 7.173, vote_count: 1430),
        Movie(title: "Aquaman and the Lost Kingdom", poster_path: URL(string: "https://image.tmdb.org/t/p/original/7lTnXOy0iNtBAdRP3TZvaKJ77F6.jpg")!, overview: "Black Manta, still driven by the need to avenge his father's death and wielding the power of the mythic Black Trident, will stop at nothing to take Aquaman down once and for all. To defeat him, Aquaman must turn to his imprisoned brother Orm, the former King of Atlantis, to forge an unlikely alliance in order to save the world from irreversible destruction.", backdrop_path: URL(string: "https://image.tmdb.org/t/p/original/jXJxMcVoEuXzym3vFnjqDW4ifo6.jpg")!, popularity: 2998.367, vote_average: 6.857, vote_count: 823),
        Movie(title: "Migration", poster_path: URL(string: "https://image.tmdb.org/t/p/w500/ldfCF9RhR40mppkzmftxapaHeTo.jpg")!, overview: "After a migrating duck family alights on their pond with thrilling tales of far-flung places, the Mallard family embarks on a family road trip, from New England, to New York City, to tropical Jamaica.", backdrop_path: URL(string: "https://image.tmdb.org/t/p/original/meyhnvssZOPPjud4F1CjOb4snET.jpg")!, popularity: 1182.849, vote_average: 7.837, vote_count: 215),
        Movie(title: "Lift", poster_path: URL(string: "https://image.tmdb.org/t/p/w500/gma8o1jWa6m0K1iJ9TzHIiFyTtI.jpg")!, overview: "An international heist crew, led by Cyrus Whitaker, race to lift $500 million in gold from a passenger plane at 40,000 feet.", backdrop_path: URL(string: "https://image.tmdb.org/t/p/original/rz8GGX5Id2hCW1KzAIY4xwbQw1w.jpg")!, popularity: 1013.609, vote_average: 6.4, vote_count: 506),
        Movie(title: "Society of the Snow", poster_path: URL(string: "https://image.tmdb.org/t/p/w500/2e853FDVSIso600RqAMunPxiZjq.jpg")!, overview: "In October 13, 1972, Uruguayan Air Force Flight 571, chartered to take a rugby team to Chile, crashes into a glacier in the heart of the Andes.", backdrop_path: URL(string: "https://image.tmdb.org/t/p/original/vdpE5pjJVql5aD6pnzRqlFmgxXf.jpg")!, popularity: 865.67, vote_average: 8.073, vote_count: 1337)
    ]
}
*/
