//
//  GFAvatarImageView.swift
//  GHFollowers
//
//  Created by Jas Lamba on 2022-03-27.
//

import UIKit

class GFAvatarImageView: UIImageView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    let placeholderImage = Images.placeholderImage
    let cache = NetworkManager.shared.cache
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true //allows the image to be rounded too
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false //important to always include this
    }
}
