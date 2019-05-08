//
//  MovieTableViewController.swift
//  MovieList
//
//  Created by JETS Mobile Lab-12 on 5/5/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import UIKit
import CoreData

class MovieTableViewController: UITableViewController, AddMovieProtocol{
    
    
//    var movieMgr = MoviesManager()
//    var moviesList : [Movie]?
    var movies = Array<NSManagedObject>()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
//        moviesList = movieMgr.getMovies()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managerContext = appDelegate.persistentContainer.viewContext
        let fetchRequset = NSFetchRequest<NSManagedObject>(entityName: "MovieEntity")
        do{
            movies = try managerContext.fetch(fetchRequset)
        }catch{
            print("Error")
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = movies[indexPath.row].value(forKey: "title") as! String
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.destination.restorationIdentifier == "details" {
            let viewController = segue.destination as! ViewController
            viewController.titleString = movies[(self.tableView.indexPathForSelectedRow?.row)!].value(forKey: "title") as! String
            viewController.image = movies[(self.tableView.indexPathForSelectedRow?.row)!].value(forKey: "image") as! String
            viewController.rating = movies[(self.tableView.indexPathForSelectedRow?.row)!].value(forKey: "rating") as! Float
            viewController.genre = movies[(self.tableView.indexPathForSelectedRow?.row)!].value(forKey: "genre") as! String
            viewController.releaseYear = movies[(self.tableView.indexPathForSelectedRow?.row)!].value(forKey: "releaseYear") as! Int 
        }else if segue.destination.restorationIdentifier == "add"{
            let viewController = segue.destination as! AddViewController
            viewController.tableView = self
        }
    }
    
    func addMovie(title: String, image: String, rating: Float, releaseYear: Int, genre: String) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managerContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "MovieEntity", in: managerContext)
        let movie = NSManagedObject(entity: entity!, insertInto: managerContext)
        movie.setValue(title, forKey: "title")
        movie.setValue(image, forKey: "image")
        movie.setValue(rating, forKey: "rating")
        movie.setValue(releaseYear, forKey: "releaseYear")
        movie.setValue(genre, forKey: "genre")
        do{
            try managerContext.save()
            movies.append(movie)
            self.tableView.reloadData()
        }catch{
            print("Error")
        }
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let managerContext = appDelegate.persistentContainer.viewContext
            managerContext.delete(movies[indexPath.row])
            // Delete the row from the data source
            
            movies.remove(at: indexPath.row)
            do{
                try managerContext.save()
            }catch{
                print("Error")
            }
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
