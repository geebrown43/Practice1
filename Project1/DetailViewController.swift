//
//  DetailViewController.swift
//  Project1
//
//  Created by Gavin Brown on 1/10/19.
//  Copyright © 2019 DevelopIT. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = selectedImage
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped)) //action is saying when a button is tapped what method should be called --- target is saying that the method belongs to self(current view controller) -- #selector tells Swift complier that a method called sahreTapped will exist and should be triggered when button is tapped
        navigationItem.largeTitleDisplayMode = .never // makes the text small instead of large unlike parent class
        if let selected = selectedImage{
            imageView.image = UIImage(named: selected) // sets cell image to what was selected
        }
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func shareTapped() {  // @objc means method will be called by OBJ-C operating system --SN: if you use #selector you must use @objc as well
        let vc = UIActivityViewController(activityItems: [imageView.image!], applicationActivities: []) // UIActivityViewController shares content with other apps
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem // tells IOS where activity view controller should be anchored- where should appear from
        present(vc, animated: true)
    }

    override var prefersHomeIndicatorAutoHidden: Bool {
        return navigationController?.hidesBarsOnTap ?? false
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
