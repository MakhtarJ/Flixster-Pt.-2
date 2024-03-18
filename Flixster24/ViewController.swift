//
//  ViewController.swift
//  Flixster24
//
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var movieTV: UITableView!
    
    var movies: [Movie] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Create a URL for the request
        // In this case, the custom search URL you created in in part 1
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=f81aa10389cdec93d77c006462cc33c8")!

        // Use the URL to instantiate a request
        let request = URLRequest(url: url)

        // Create a URLSession using a shared instance and call its dataTask method
        // The data task method attempts to retrieve the contents of a URL based on the specified URL.
        // When finished, it calls it's completion handler (closure) passing in optional values for data (the data we want to fetch), response (info about the response like status code) and error (if the request was unsuccessful)
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

            // The `JSONSerialization.jsonObject(with: data)` method is a "throwing" function (meaning it can throw an error) so we wrap it in a `do` `catch`
            // We cast the resultant returned object to a dictionary with a `String` key, `Any` value pair.
            do {
                // Create a JSON Decoder
                let decoder = JSONDecoder()

                // Create a date formatter
                let dateFormatter = DateFormatter()

                // Set a custom date format based on what we see coming back in the JSON
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

                // Set the decoding strategy on the JSON decoder to use our custom date format
                decoder.dateDecodingStrategy = .formatted(dateFormatter)

                
                // Use the JSON decoder to try and map the data to our custom model.
                // TrackResponse.self is a reference to the type itself, tells the decoder what to map to.
                let response = try decoder.decode(MovieResponse.self, from: data)

                // Access the array of tracks from the `results` property
                let movies = response.results
                DispatchQueue.main.async {
                    self?.movies = movies
                    self?.movieTV.reloadData()
                }
                print("✅ \(movies)")
            } catch {
                print("❌ Error parsing JSON: \(error.localizedDescription)")
            }
        }

        // Initiate the network request
        task.resume()
        print("Hello ")
        
        movieTV.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC = segue.destination as? DetailVC, let cell = sender as? UITableViewCell, let indexPath = movieTV.indexPath(for: cell) {
            detailVC.movie = movies[indexPath.row]
        }
            
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Get the index path for the current selected table view row (if exists)
        if let indexPath = movieTV.indexPathForSelectedRow {

            // Deselect the row at the corresponding index path
            movieTV.deselectRow(at: indexPath, animated: true)
        }
    }
}


extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath : IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        cell.configure(movie: movies[indexPath.row])
        
        
        return cell
    }
}
