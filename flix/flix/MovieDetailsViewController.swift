//
//  MovieDetailsViewController.swift
//  flix
//
//  Created by Frank Choukouali on 9/18/21.
//

import UIKit
import AlamofireImage
class MovieDetailsViewController: UIViewController {
    
    var movie: [String:Any]!
    @IBOutlet weak var backdrop: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var showView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
        titleLabel.text = movie["title"] as? String
        titleLabel.sizeToFit()
        descriptionLabel.text = movie["overview"] as? String
        descriptionLabel.sizeToFit()
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath =  movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl+posterPath)
        showView.af.setImage(withURL: posterUrl!)
        
        let backdropPath =  movie["backdrop_path"] as! String
        let backdropUrl = URL(string: "https://image.tmdb.org/t/p/w780"+backdropPath)
        backdrop.af.setImage(withURL: backdropUrl!)
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
