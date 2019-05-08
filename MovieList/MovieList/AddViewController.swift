//
//  AddViewController.swift
//  MovieList
//
//  Created by JETS Mobile Lab-12 on 5/5/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {


    @IBOutlet var titleMovie: UITextField!
    @IBOutlet var imageMovie: UITextField!
    @IBOutlet var ratingMoving: UITextField!
    @IBOutlet var releaseMovie: UITextField!
    @IBOutlet var genreMovie: UITextField!
    
    var tableView : AddMovieProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()

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

    @IBAction func addMovie(_ sender: UIButton) {
        tableView?.addMovie(title: titleMovie.text!, image: imageMovie.text!, rating: Float(ratingMoving.text!)!, releaseYear: Int(releaseMovie.text!)!, genre: genreMovie.text!)
        self.navigationController?.popViewController(animated: true)
    }
}
