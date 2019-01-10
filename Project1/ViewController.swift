//
//  ViewController.swift
//  Project1
//
//  Created by Gavin Brown on 1/9/19.
//  Copyright © 2019 DevelopIT. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = "Storm Viewer" // adds title to navigation bar
        navigationController?.navigationBar.prefersLargeTitles = true
        let fm = FileManager.default // allows us to look for files
        let path = Bundle.main.resourcePath! // finds files added to app
        let items = try! fm.contentsOfDirectory(atPath: path) // returns contents of path -- is an array with names of all files found in resource directory
        
        for item in items {
            if item.hasPrefix("nssl") {
                //this is a picture to load
                pictures.append(item) // adds photos string to array
                
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count //returns number of items in Array similar to Array.length(JavaScript)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {  // cellForRowat: called when need to provide a row -- indexPath: data type contains section number and row number
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath) //dequeues a recycled cell from the table must give identifier in this case Picture
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1: try loading the "Detail" view controller and typecasting it to be DetailViewController
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            // 2: success! Set its selectedImage property
        vc.selectedImage = pictures[indexPath.row]
            
            // 3: now push it onto the navigation controller
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    


}

