//
//  ViewController.swift
//  MovieList
//
//  Created by JETS Mobile Lab-12 on 5/5/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var img: UIImageView!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var genereLabel: UILabel!
    @IBOutlet var releaseLabel: UILabel!
    
    var titleString: String = ""
    var image: String = ""
    var rating: Float = 0.0
    var genre: String = ""
    var releaseYear: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        titleLabel.text = titleString
        img.image = UIImage(named: (image))
        ratingLabel.text?.append(contentsOf: String((rating)))
        releaseLabel.text?.append(contentsOf: String((releaseYear)))
        genereLabel.text?.append(contentsOf: (genre))
    }


}

