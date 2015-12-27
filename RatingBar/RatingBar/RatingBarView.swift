//
//  RatingBarView.swift
//  RatingBar
//
//  Created by MacBook Air on 12/16/15.
//
//

import UIKit

class RatingBarView: UIView {

    var rating = 0
    var currentRating = 0;
    var rating_array = [RatingStar]()
    var image_empty_selected: UIImage = UIImage()
    var image_filled_selected: UIImage = UIImage()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        //fatalError("init(coder:) has not been implemented")
    }
    
    init(image_empty: UIImage, image_filled: UIImage, number_of_elements: Int, initial_position: CGRect, already_rated: Int, space_between_stars: CGFloat) {
        self.image_empty_selected = image_empty
        self.image_filled_selected = image_filled
        self.rating = already_rated
        
        super.init(frame: CGRectMake(initial_position.origin.x, initial_position.origin.y, 600, 60))
        
        self.userInteractionEnabled = true
        
        var i = 0
        var position_frame = initial_position
        position_frame.origin.y = 0
        
        while i < number_of_elements{
            
            let button = RatingStar(image_empty: image_empty, image_rated: image_filled, frame: position_frame)
            position_frame.origin.x += space_between_stars
            
            button.addTarget(self, action: "ratingClicked:", forControlEvents: UIControlEvents.TouchUpInside)
            
            if(i < already_rated){
                button.isTapped = true
            }
            
            self.rating_array.append(button)
            addSubview(button)
            i++
        }
    }
    
    func ratingClicked(sender: RatingStar) {
        
        if(self.rating == 0){
            let index_clicked = rating_array.indexOf(sender)
            self.currentRating = index_clicked! + 1
            
            if(index_clicked == 0 && sender.isTapped == true && (rating_array[(index_clicked! + 1)].isTapped == false)){
                rating_array[index_clicked!].isTapped = false
                self.currentRating = 0
            }else{
                for rating_button in rating_array{
                    if(rating_array.indexOf(rating_button) <= index_clicked){
                        //rating_button.setImage(image_filled_selected, forState: .Normal)
                        rating_button.isTapped = true
                    }else{
                        //rating_button.setImage(image_empty_selected, forState: .Normal)
                        rating_button.isTapped = false
                    }
                }
            }
            
            print("current rating: \(self.currentRating)")
        }
    }
    
    override func intrinsicContentSize() -> CGSize {
        return CGSize(width: 600, height: 60)
    }

}
