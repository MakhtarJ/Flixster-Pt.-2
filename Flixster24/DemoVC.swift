//
//  DemoVC.swift
//  Flixster24
//
//

import UIKit
import Nuke
class DemoVC: UIViewController {

    @IBOutlet weak var titlebl: UILabel!
    @IBOutlet weak var avgLbl: UILabel!
    @IBOutlet weak var votelbl: UILabel!
    @IBOutlet weak var popLbl: UILabel!
    @IBOutlet weak var overviewLbl: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let movie = movie {
            titlebl.text = movie.title
            avgLbl.text = String(movie.vote_average)
            votelbl.text = String(movie.vote_count)
            popLbl.text = String(movie.popularity)
            overviewLbl.text = movie.overview
            
            Nuke.loadImage(with: movie.backdrop_path, into: imageView)
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
