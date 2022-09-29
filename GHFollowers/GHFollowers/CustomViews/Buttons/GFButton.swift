//
//  GFButton.swift
//  GHFollowers
//
//  Created by Jas Lamba on 2022-02-22.
//

import UIKit

class GFButton: UIButton {
    
    //GFButton stands for GitFollower button to signal that this is customally built for this project

    override init(frame: CGRect) {
        //because we are created a subclass of UIButton we need to override the defualt init methodd build by Apple
        super.init(frame: frame)
        //then do custom code
        configure()
    }
    
    required init?(coder: NSCoder) {
        //need to add this because we are not using storyboard, otherwise xcode doesn't like it
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(backgroundColor: UIColor, title: String) {
        //normally when you intizlize a button you have to give it width or height but gonna use autolayout so give frame 0
        self.init(frame: .zero)
        //self means this button
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
    }
    
    private func configure() {
        //private method because we don't want outside classes calling this
        layer.cornerRadius = 10
//        titleLabel?.textColor = .white
        setTitleColor(.white, for: .normal) //defualt color is white but if needed to change we can
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline) // allows for dynamic text
        //dynamic type is to account for what the user has set up in settings i.e font size to be smaller or larger
        //https://github.com/cocoacontrols/SemanticUI
        translatesAutoresizingMaskIntoConstraints = false // use autolayout
    }
    
    func set(backgroundColor: UIColor, title: String) {
        self.backgroundColor = backgroundColor
        setTitle(title, for: .normal)
    }
}
