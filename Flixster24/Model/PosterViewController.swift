//
//  PosterViewController.swift
//  Flixster24
//
//  Created by user253148 on 2/28/24.
//

import UIKit
import Nuke
class PosterViewController: UIViewController {
    var movies: [Movie] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        // Create a search URL for fetching albums (`entity=album`)
        posterNetworkRequest()
        setupLayout()

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC = segue.destination as? DetailVC, let cell = sender as? UICollectionViewCell, let indexPath = collectionView.indexPath(for: cell){
            detailVC.movie = movies[indexPath.item]
        }
            
    }
    func setupLayout(){
        // Get a reference to the collection view's layout
        // We want to dynamically size the cells for the available space and desired number of columns.
        // NOTE: This collection view scrolls vertically, but collection views can alternatively scroll horizontally.
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        // The minimum spacing between adjacent cells (left / right, in vertical scrolling collection)
        // Set this to taste.
        layout.minimumInteritemSpacing = 4
        
        // The minimum spacing between adjacent cells (top / bottom, in vertical scrolling collection)
        // Set this to taste.
        layout.minimumLineSpacing = 4
        
        // Set this to however many columns you want to show in the collection.
        let numberOfColumns: CGFloat = 3
        
        // Calculate the width each cell need to be to fit the number of columns, taking into account the spacing between cells.
        let width = (collectionView.bounds.width - layout.minimumInteritemSpacing * (numberOfColumns - 1)) / numberOfColumns
        
        // Set the size that each tem/cell should display at
        layout.itemSize = CGSize(width: width, height: width)
    }
    func posterNetworkRequest(){
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=f81aa10389cdec93d77c006462cc33c8")!
        let request = URLRequest(url: url)

        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in

            // Handle any errors
            if let error = error {
                print("❌ Network error: \(error.localizedDescription)")
            }

            // Make sure we have data
            guard let data = data else {
                print("❌ Data is nil")
                return
            }
            let decoder = JSONDecoder()

            do {
                let response = try decoder.decode(MovieResponse.self, from: data)

                let movies = response.results
                
                DispatchQueue.main.async {
                    self?.movies = movies
                    self?.collectionView.reloadData()
                }
            } catch {
                print("❌ Error parsing JSON: \(error.localizedDescription)")
            }
        }

        // Initiate the network request
        task.resume()

        // Do any additional setup after loading the view.
    }
    

}


extension PosterViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCell
        //cell.postImageView
        let movies = movies[indexPath.item]
        let imageURL = movies.posterURL
        Nuke.loadImage(with: imageURL, into: cell.postImageView)
        return cell
    }
}
