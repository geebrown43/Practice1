//
//  ViewController.swift
//  Project1
//
//  Created by Gavin Brown on 1/9/19.
//  Copyright © 2019 DevelopIT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var pictures: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let fm = FileManager.default // allows us to look for files
        let path = Bundle.main.resourcePath! // finds files added to app
        let items = try! fm.contentsOfDirectory(atPath: path) // returns contents of path -- is an array with names of all files found in resource directory
        
        for item in items {
            if item.hasPrefix("nssl") {
                //this is a picture to load
                pictures.append(item) // adds photos string to array
                
            }
        }
        
        print(pictures)
    }


}

