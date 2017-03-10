//
//  MovieListTableViewCell.swift
//  MovieSearch
//
//  Created by Hayden Hastings on 3/10/17.
//  Copyright © 2017 Open Reel Software. All rights reserved.
//

import UIKit

class MovieListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var overviewTextView: UITextView!
    
    var movie: HHMovie? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        var movie = HHMovie() {
            didSet {
                
                DispatchQueue.main.async {
                    self.nameLabel.text = movie.originalTitle
                    self.ratingLabel.text = movie.voteAverage
                    self.overviewTextView.text = movie.overview
                }
            }
        }
    }
}
