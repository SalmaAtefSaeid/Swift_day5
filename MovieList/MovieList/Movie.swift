//
//  Movie.swift
//  MovieList
//
//  Created by JETS Mobile Lab-12 on 5/5/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import Foundation

class Movie{
    
    init(title : String, image : String, rating : Float, releaseYear : Int,
         genre : String) {
        self.title = title
        self.image = image
        self.rating = rating
        self.releaseYear = releaseYear
        self.genre = genre
    }
    var title : String
    var image : String
    var rating : Float
    var releaseYear : Int
    var genre : String
}
