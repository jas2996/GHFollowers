//
//  GFFollowerItemVC.swift
//  GHFollowers
//
//  Created by Jas Lamba on 2022-06-15.
//

import UIKit

protocol GFFollowerItemVCDelegate: class {
    func didTapGitHubFollowers(for user: User)
}

class GFFollowerItemVC: GFItemInfoVC {
    //delegates need to be weak so you can avoid retain cycle
    weak var delegate: GFFollowerItemVCDelegate!
    
    init(user: User, delegate: GFFollowerItemVCDelegate ) {
        super.init(user: user)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
