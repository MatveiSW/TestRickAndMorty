//
//  AlertManager.swift
//  TestRickAndMorty
//
//  Created by Матвей Авдеев on 08.07.2024.
//

import Foundation

import UIKit

final class AlertManager {
    
    let coef = UIScreen.main.bounds.height.adjustSizeHeight()
    
    func showAlert(style: UIAlertController.Style, title: String?, message: String?, actions: [UIAlertAction] = [UIAlertAction(title: "OK", style: .cancel, handler: nil)], completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        alert.view.tintColor = UIColor(red: 0.957, green: 0.298, blue: 0.008, alpha: 1)
        var imageAttachment = NSTextAttachment()
        var title = title
        if title == "green" {
            imageAttachment = NSTextAttachment(image: UIImage(systemName: "exclamationmark.circle")!.withTintColor(UIColor(red: 0.0353, green: 0.698, blue: 0.0118, alpha: 1), renderingMode: .alwaysTemplate))
            title = ""
        } else if title == "yellow" {
            imageAttachment = NSTextAttachment(image: UIImage(systemName: "exclamationmark.circle")!.withTintColor(UIColor(red: 0.917, green: 0.692, blue: 0.122, alpha: 1), renderingMode: .alwaysTemplate))
            title = ""
        } else if title == "red" {
            imageAttachment = NSTextAttachment(image: UIImage(systemName: "exclamationmark.circle")!.withTintColor(.red, renderingMode: .alwaysTemplate))
            title = ""
        }

        imageAttachment.bounds = CGRect(x: 0, y: -12.5 * coef, width: 30 * coef, height: 30 * coef)
        let image = NSMutableAttributedString(attachment: imageAttachment)
        let titleString = NSMutableAttributedString(string: title!, attributes: [NSAttributedString.Key.font: UIFont(name: "Helvetica", size: 17 * coef)!, NSMutableAttributedString.Key.foregroundColor: UIColor.black])
        let messageString = NSMutableAttributedString(string: message!, attributes: [NSAttributedString.Key.font: UIFont(name: "Helvetica", size: 15 * coef)!, NSMutableAttributedString.Key.foregroundColor: UIColor.black])
        let returnString = NSMutableAttributedString(string: "\n")
        if title == "" {
            image.append(titleString)
            returnString.append(messageString)
            alert.setValue(image, forKey: "attributedTitle")
            alert.setValue(returnString, forKey: "attributedMessage")
        } else if title == "clear" && message == "clear" {
            alert.title = nil
            alert.message = nil
        } else {
            alert.setValue(titleString, forKey: "attributedTitle")
            alert.setValue(messageString, forKey: "attributedMessage")
        }
        for action in actions {
            alert.addAction(action)
        }
        if let topViewController = UIApplication.getTopMostViewController() {
            alert.popoverPresentationController?.sourceView = topViewController.view
            alert.popoverPresentationController? .sourceRect = CGRect(x: topViewController.view.bounds.midX, y: topViewController.view.bounds.midY, width: 0, height: 0)
            alert.popoverPresentationController?.permittedArrowDirections = []
            alert.pruneNegativeWidthConstraints()
            if UIApplication.getTopMostViewController()!.isKind(of: UIAlertController.self) {
                return
            } else {
                topViewController.present(alert, animated: true, completion: nil)
            }
        }
    }
}
