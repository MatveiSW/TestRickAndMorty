//
//  AlertController.swift
//  TestRickAndMorty
//
//  Created by Матвей Авдеев on 08.07.2024.
//

import UIKit

extension UIAlertController {
    
    func pruneNegativeWidthConstraints() {
        for subView in self.view.subviews {
            for constraint in subView.constraints where constraint.debugDescription.contains("width == - 16") {
                subView.removeConstraint(constraint)
            }
        }
    }
}
