//
//  UITableView+Ext.swift
//  GHFollowers
//
//  Created by Jas Lamba on 2022-10-05.
//

import UIKit

extension UITableView {
    
    func reloadDataOnMainThreat() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
    
    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
}
