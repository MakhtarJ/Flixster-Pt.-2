//
//  DetailVC.swift
//  Flixster24
//
//

import UIKit
import Nuke

class DetailVC: UIViewController {
    @IBOutlet weak var backdropIV: UIImageView!
    @IBOutlet weak var popularityLbl: UILabel!
    @IBOutlet weak var votesLbl: UILabel!
    @IBOutlet weak var voteAverageLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var overviewLbl: UILabel!
    
    var movie: Movie!
    var Poster: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if Poster != nil {
            // TODO
        } else {
            // Do any additional setup after loading the view.
            // Use backDropURL instead of backdrop_path
            if let backDropURL = movie.backDropURL {
                Nuke.loadImage(with: backDropURL, into: backdropIV)
            } else {
                // Handle the case where backDropURL is nil
                print("Backdrop URL is nil")
            }
            
            overviewLbl.text = movie.overview
            popularityLbl.text = String(movie.popularity) + " Popularity"
            voteAverageLbl.text = "\(movie.vote_average) Vote Average"
            votesLbl.text = "\(movie.vote_count) Votes"
            titleLbl.text = movie.title
        }
        
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let demoVC = segue.destination as? DemoVC {
            demoVC.movie = movie
        }
    }
    

}
