//
//  MoviesManager.swift
//  MovieList
//
//  Created by JETS Mobile Lab-12 on 5/5/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import Foundation

class MoviesManager{
    
    func getMovies() -> [Movie] {
        
        let movie1 = Movie(title: "A Bug's Life", image: "bug'sLife.jpg", rating: 7.2, releaseYear: 1998, genre: "Animation")
        let movie2 = Movie(title: "How to Train Your Dragon", image: "Dragon.jpg", rating: 8.2, releaseYear: 2010, genre: "Animation")
        let movie3 = Movie(title: "Despicable Me 2", image: "Despicable.jpg", rating: 7.6, releaseYear: 2013, genre: "Animation")
        let movie4 = Movie(title: "The Amazing Spider-Man 2", image: "Spider-Man.jpg", rating: 7.3, releaseYear: 2014, genre: "Action")
        let movie5 = Movie(title: "Tangled", image: "tangled.jpg", rating: 7.9, releaseYear: 2010, genre: "Action")
        let moviesList = [movie1, movie2, movie3, movie4, movie5]
        return moviesList
    }
    
    
}
