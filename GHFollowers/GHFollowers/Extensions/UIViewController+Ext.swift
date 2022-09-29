//
//  UIViewController+Ext.swift
//  GHFollowers
//
//  Created by Jas Lamba on 2022-03-13.
//

import UIKit
import SafariServices

fileprivate var containerView: UIView! //global var, no one access this var excepting something in this file

extension UIViewController {
    //fyi extenions cannont contain stored properties
    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(alertTitle: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
    
    func presentSafariVC(with url: URL) {
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredControlTintColor = .systemGreen
        present(safariVC, animated: true)
    }
}
