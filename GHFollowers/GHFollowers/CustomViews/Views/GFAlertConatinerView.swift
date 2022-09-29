//
//  GFAlertConatinerView.swift
//  GHFollowers
//
//  Created by Jas Lamba on 2022-09-29.
//

import UIKit

class GFAlertConatinerView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 16
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 2
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground
    }
}
