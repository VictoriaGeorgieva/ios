//
//  ViewController.swift
//  RatingBar
//
//  Created by MacBook Air on 12/16/15.
//
//

import UIKit

class ViewController: UIViewController {

    var ratingBar: RatingBarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        let frame_main = CGRectMake(0, 30, 50, 50)
        
        // set already_rated: 0 if you want rating functionality
        // set already_rated: 3 for example if you want to show already confirmed rating(number of stars)
        
        ratingBar = RatingBarView(image_empty: UIImage(named: "ic_star_border")!, image_filled: UIImage(named: "ic_star")!, number_of_elements: 5, initial_position: frame_main, already_rated: 0, space_between_stars: 55)
        view.addSubview(ratingBar)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

