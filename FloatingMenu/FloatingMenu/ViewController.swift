//
//  ViewController.swift
//  FloatingMenu
//
//  Created by MacBook Air on 12/13/15.
//
//

import UIKit

class ViewController: UIViewController, FloatingMenuControllerDelegate {

    var floatingMenuButton: FloatingButton!
    var imagesNames = ["ic_reply", "ic_create", "ic_photo_camera", "ic_photo"]
    var optionsTitles = ["title 1", "title 2", "title 3", "title 4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        initFloatingButton()
    }
    
    func initFloatingButton(){
        let bounds = UIScreen.mainScreen().bounds
        let frame_main = CGRectMake(bounds.size.width-80, bounds.size.height-80, 50, 50)
        
        floatingMenuButton = FloatingButton(image: UIImage(named: "ic_add"), frame: frame_main, title: "")
        view.addSubview(floatingMenuButton)
        floatingMenuButton.addTarget(self, action: "clickedFloatingMenu:", forControlEvents: .TouchUpInside)
    }
    
    // after opening floating menu this functions starts FloatingMenuController
    func clickedFloatingMenu(sender: FloatingButton) {
        
        let controller = FloatingMenuController(fromView: sender as FloatingButton)
        var first_option = sender.frame
        
        var i = 0
        while i < imagesNames.count{
            
            first_option.origin.y -= 60
            controller.optionButtons.append(FloatingButton(image: UIImage(named: imagesNames[i]), frame: first_option, title: optionsTitles[i]))
            i++
        }
        
        if #available(iOS 8.0, *) {
            self.definesPresentationContext = true
            controller.view.backgroundColor = UIColor.clearColor()
            controller.modalPresentationStyle = UIModalPresentationStyle.OverCurrentContext
        }
        
        controller.delegate = self
        presentViewController(controller, animated: true, completion: nil)
    }
    
    // use this method to set actual functionality on each floating button
    func floatingMenuController(controller: FloatingMenuController, didTapOnButton button: UIButton, atIndex index: Int) {
        print("tapped index \(index)")
        
        
        switch index {
        case 0:
            print("action - index:\(index)")
        case 1:
            print("action - index:\(index)")
        case 2:
            print("action - index:\(index)")
        case 3:
            print("action - index:\(index)")
        default:
            print("no action")
        }
        
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func floatingMenuControllerDidCancel(controller: FloatingMenuController) {
        if #available(iOS 8.0, *) {
            initFloatingButton()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

