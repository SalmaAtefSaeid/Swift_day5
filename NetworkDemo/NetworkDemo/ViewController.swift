//
//  ViewController.swift
//  NetworkDemo
//
//  Created by JETS Mobile Lab-12 on 5/5/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func start(_ sender: UIButton) {
        
        let url = URL (string: "https://api.androidhive.info/json/movies.json")
        let request = URLRequest (url: url!)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: request) { (data, responce, error) in
            do{
                var output = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as!
                    Array<Dictionary<String, Any>>
                var dict = output[0]
                print(dict["title"]!)
                DispatchQueue.main.async {
                    self.label.text = dict["title"]! as! String
                }
                
            }catch{
                print("Error")
            }
        }.resume()
    }

}

