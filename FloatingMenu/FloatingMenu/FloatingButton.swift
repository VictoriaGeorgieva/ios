//
//  FloatingButton.swift
//  FloatingMenu
//
//  Created by MacBook Air on 12/13/15.
//
//

// custom button for floating menu

import UIKit

class FloatingButton: UIButton {

    var title = ""
    
    convenience init(image: UIImage?, frame: CGRect, title: String) {
        self.init()
        self.title = title
        configureButton(frame)
        setImage(image, forState: .Normal)
    }
    
    func configureButton(frame: CGRect){
        self.frame = frame
        self.backgroundColor = UIColor.whiteColor()
        self.layer.cornerRadius = self.frame.size.width / 2
        self.titleEdgeInsets = UIEdgeInsetsMake(-5, 0, 0, 0)
    }

}
