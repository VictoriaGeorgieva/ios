//
//  RatingStar.swift
//  RatingBar
//
//  Created by MacBook Air on 12/16/15.
//
//

import UIKit

class RatingStar: UIButton {

    var image_empty_sel: UIImage!
    var image_filled_sel: UIImage!
    
    var isTapped:Bool = false{
        didSet{
            if (isTapped == true) {
                self.setImage(self.image_filled_sel, forState: .Normal)
            }else{
                self.setImage(self.image_empty_sel, forState: .Normal)
            }
        }
    }
    
    convenience init(image_empty: UIImage?, image_rated: UIImage?, frame: CGRect) {
        self.init()
        
        self.image_empty_sel = image_empty
        self.image_filled_sel = image_rated
        self.frame = frame
        setImage(image_empty, forState: .Normal)
    }

}
