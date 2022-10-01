//
//  UIView+Ext.swift
//  GHFollowers
//
//  Created by Jas Lamba on 2022-09-30.
//

import UIKit

extension UIView {
    //Variadic Parameters
    func addSubviews(_ views: UIView ...) {
        for view in views {
            addSubview(view)
        }
    }
}
