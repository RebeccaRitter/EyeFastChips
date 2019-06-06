//
//  BlinkingLabel.swift
//  twofold
//
//  Created by Allen Boynton on 1/4/19.
//  Copyright © 2019 Allen Boynton. All rights reserved.
//

import UIKit

extension UIView {
    func startBlink() {
        self.alpha = 1.0
        UIView.animate(withDuration: 0.6,
            delay: 0.0,
            options: [.curveEaseInOut, .autoreverse, .repeat],
            animations: { self.alpha = 0 },
            completion: nil)
    }
}
