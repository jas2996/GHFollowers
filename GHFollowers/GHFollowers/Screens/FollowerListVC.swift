//
//  FollowerListVC.swift
//  GHFollowers
//
//  Created by Jas Lamba on 2022-02-22.
//

import UIKit

class FollowerListVC: UIViewController {
    
    enum Section {
        case main
    }
    
    var username: String! //get ready to accept username from SearchVC
    var followers: [Follower] = []
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureCollectionView()
        getFollowers()
        configureDataSource()
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
        NetworkManager.shared.getFollowers(for: username, page: 1) { [weak self] result in
            // review ARC (automatic reference counting)
            guard let self = self else { return }
            switch result {
            case .success(let followers):
                print("Followers.count = \(followers.count)")
                print(followers)
                self.followers = followers
                self.updateData()
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Bad stuff happened", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFolowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Follower>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, follower) -> UICollectionViewCell in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.reuseID, for: indexPath) as! FollowerCell
            cell.set(follower: follower)
            
            return cell
        })
    }
    
    func updateData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapshot.appendSections([.main])
        snapshot.appendItems(followers)
        
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }

}

