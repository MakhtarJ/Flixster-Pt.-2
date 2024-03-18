//
//  MovieCell.swift
//  Flixster24
//
//

import UIKit
import Nuke

class MovieCell: UITableViewCell {

    @IBOutlet weak var posterIV: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var overviewLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(movie: Movie){
        Nuke.loadImage(with: movie.posterURL, into: posterIV)
        
        titleLbl.text = movie.title
        overviewLbl.text = movie.overview
    }

}
