//
//  FollowerListVC.swift
//  GHFollowers
//
//  Created by Jas Lamba on 2022-02-22.
//

import UIKit

class FollowerListVC: UIViewController {
    
    var username: String! //get ready to accept username from SearchVC
    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureCollectionView()
        getFollowers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        navigationController?.isNavigationBarHidden = false //now we want to show the nav bar unlike SearchVC
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true //we want large title instead of old small title
    }
    
    func getFollowers() {
//        MARK: - without using Result type (Swift 5)
//        NetworkManager.shared.getFollowers(for: username, page: 1) { followers, errorMessage in
//            guard let followers = followers else {
//                self.presentGFAlertOnMainThread(title: "Bad stuff happened", message: errorMessage!.rawValue, buttonTitle: "Ok")
//                return
//            }
//
//            print("Followers.count = \(followers.count)")
//            print(followers)
//
//        }
        
//       MARK: - using Result type (Swift 5)
        NetworkManager.shared.getFollowers(for: username, page: 1) { result in
            
            switch result {
            case .success(let followers):
                print("Followers.count = \(followers.count)")
                print(followers)
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Bad stuff happened", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createThreeColumnFolowLayout())
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemPink
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
    }
    
    func createThreeColumnFolowLayout() -> UICollectionViewLayout {
        //this is how the collection view will look like
        let width = view.bounds.width
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
