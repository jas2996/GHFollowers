//
//  GFFollowerItemVC.swift
//  GHFollowers
//
//  Created by Jas Lamba on 2022-06-15.
//

import UIKit

class GFFollowerItemVC: GFItemInfoVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
        
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.following)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.followers)
        actionButton.set(backgroundColor: .systemGreen, title: "Get Followers")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGitHubFollowers(for: user)
    }

}
