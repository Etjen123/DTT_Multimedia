//
//  ButtonClass.swift
//  DTTMultimedia
//
//  Created by Etjen Ymeraj on 4/26/16.
//  Copyright © 2016 Etjen Ymeraj. All rights reserved.
//

import UIKit

class ButtonClass: NSObject {
    
    class myButton : UIButton {
        override var highlighted: Bool {
            didSet {
                if (highlighted) {
                    self.backgroundColor = UIColor(patternImage : UIImage(named: "btn_bel_normal@3x.png")!)
                } else {
                    self.backgroundColor = UIColor(patternImage : UIImage(named: "btn_bel_pressed@3x.png")!)
                }
            }
        }
    }
    
}