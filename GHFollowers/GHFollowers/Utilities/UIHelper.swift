//
//  UIHelper.swift
//  GHFollowers
//
//  Created by Jas Lamba on 2022-04-17.
//

import UIKit
// if you import UIKit, Foundation comes with it also

struct UIHelper {
    static func createThreeColumnFolowLayout(in view: UIView) -> UICollectionViewLayout {
        //this is how the collection view will look like
        let width = view.bounds.width //width of phone screen
        let padding: CGFloat = 12 //left and right side of the screen
        let minimumItemSpacing: CGFloat = 10 //between each cell
        let availableWidth = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth = availableWidth / 3
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        //height includes the avatar image and also the username label
        
        return flowLayout
    }
}
