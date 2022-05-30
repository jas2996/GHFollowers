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
    
    let placeholderImage = UIImage(named: "avatar-placeholder")!
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
    
    func downloadImage(from urlString: String) {
        
        let cahceKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cahceKey) {
            self.image = image
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self]data, response, error in
            guard let self = self else { return }
            
            if error != nil { return }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            guard let data = data else { return }
            guard let image = UIImage(data: data) else { return }
            
            self.cache.setObject(image, forKey: cahceKey)
            
            // anytime you update UI you have to update it on the main thread
            DispatchQueue.main.async {
                self.image = image
            }
        }
        
        task.resume()
    }
}
