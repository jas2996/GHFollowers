//
//  GFTextField.swift
//  GHFollowers
//
//  Created by Jas Lamba on 2022-02-22.
//

import UIKit

class GFTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray4.cgColor //when using layer you need cg color for core graphics
       
        textColor = .label // UITextField will be black in dark mode white in light mode
        tintColor = .label
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true // this will shrink the text if its too long
        minimumFontSize = 12 //the font will shrink but to a minimum 12 size
        
        backgroundColor = .tertiarySystemBackground
        autocorrectionType = .no
        
        keyboardType = .default
        returnKeyType = .go
        //return key will be "go" instead of defualt "return" text
        placeholder = "Enter a username"
    }

}
