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
