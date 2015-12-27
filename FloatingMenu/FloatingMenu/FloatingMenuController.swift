//
//  FloatingMenuController.swift
//  FloatingMenu
//
//  Created by MacBook Air on 12/13/15.
//
//

import UIKit

@objc
protocol FloatingMenuControllerDelegate: class {
    optional func floatingMenuController(controller: FloatingMenuController, didTapOnButton button: UIButton, atIndex index: Int)
    optional func floatingMenuControllerDidCancel(controller: FloatingMenuController)
}

class FloatingMenuController: UIViewController {

    var delegate: FloatingMenuControllerDelegate?
    
    let mainButton: FloatingButton
    var optionButtons = [FloatingButton]()
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // adding options to floating menu
        
        for option in self.optionButtons{
            option.addTarget(self, action: "optionButtonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
            
            let optionTitle = UILabel()
            optionTitle.text = option.title
            optionTitle.textColor = UIColor.whiteColor()
            optionTitle.textAlignment = .Center
            optionTitle.font = UIFont.systemFontOfSize(15)
            optionTitle.backgroundColor = UIColor.blackColor()
            optionTitle.sizeToFit()
            optionTitle.center = option.center
            optionTitle.frame.origin.x = option.frame.origin.x - optionTitle.bounds.width - 12
            optionTitle.bounds.size.height += 8
            optionTitle.bounds.size.width += 10
            optionTitle.layer.cornerRadius = 4
            optionTitle.layer.masksToBounds = true
            
            view.addSubview(optionTitle)
            view.addSubview(option)
        }
        
        mainButton.addTarget(self, action: "closeMenu:", forControlEvents: UIControlEvents.TouchUpInside)
        mainButton.setImage(UIImage(named: "ic_clear"), forState: UIControlState.Normal)
        view.addSubview(mainButton)
    }
    
    init(fromView: FloatingButton) {
        self.mainButton = fromView
        super.init(nibName: nil, bundle: nil)
    }
    
    func closeMenu(sender: FloatingButton?){
        if(sender == mainButton){
            delegate?.floatingMenuControllerDidCancel?(self)
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    // function to set custom actions on options
    func optionButtonClicked(sender: FloatingButton) {
        let button = sender
        if let index = optionButtons.indexOf(button){
            delegate?.floatingMenuController?(self, didTapOnButton: button, atIndex: index)
        }
    }

}
