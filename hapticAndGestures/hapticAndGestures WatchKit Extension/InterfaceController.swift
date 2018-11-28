//
//  InterfaceController.swift
//  hapticAndGestures WatchKit Extension
//
//  Created by Victor Vasconcelos on 27/11/18.
//  Copyright © 2018 watchsons. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBAction func swipeRight(_ sender: Any) {
        self.mainScene?.swipeRight()
    }
    
    @IBAction func swipeLeft(_ sender: Any) {
        self.mainScene?.swipeLeft()
    }
    
    
    @IBAction func swipeDown(_ sender: Any) {
        self.mainScene?.swipeDown()
    }
    
    
    @IBAction func swipeUp(_ sender: Any) {
        self.mainScene?.swipeUp()
    }
    
    @IBAction func doubleTap(_ sender: Any) {
        
        let haptic = WKInterfaceDevice()
        haptic.play(.click)
        
        self.mainScene?.tap()
    }
    
    @IBOutlet weak var sceneOutlet: WKInterfaceSKScene!
    var mainScene : MainScene?
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        mainScene = self.sceneOutlet.scene as? MainScene
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
