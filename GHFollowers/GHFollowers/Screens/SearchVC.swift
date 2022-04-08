//
//  SearchVC.swift
//  GHFollowers
//
//  Created by Jas Lamba on 2022-02-21.
//

import UIKit

class SearchVC: UIViewController {
    
    let logoImageView = UIImageView() //regular defualt uiimageview
    let usernameTextField = GFTextField() //custom text field
    let callToActionButton = GFButton(backgroundColor: .systemGreen, title: "Get Followers") //custom button
    
    //computed property
    var isUsernameEntered: Bool {
        //simply check if textfield is empty
        return !usernameTextField.text!.isEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureLogoImageView()
        configureTextField()
        configureCallToActionButton()
        createDismissKeyboardTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true //just hide the nav bar
        // doing it in viewWillAppear lifecycle method because we want to hide EACH time screen appears
        // instead of oads
    }
    
    func createDismissKeyboardTapGesture() {
        //tap anywhere on the screen to dismiss keyboard
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        // #selector is action
        view.addGestureRecognizer(tap)
    }
    
    @objc func pushFollowerListVC() {
        // cmd + ctrl + space
        guard isUsernameEntered else {
            presentGFAlertOnMainThread(title: "Empty Username", message: "Please enter a username. We need to know who to look for 😀", buttonTitle: "Ok")
            return
        }
        let followerListVC = FollowerListVC()
        followerListVC.username = usernameTextField.text //pass username to FollowerListVC
        followerListVC.title = usernameTextField.text
        navigationController?.pushViewController(followerListVC, animated: true)
    }
    
    func configureLogoImageView() {
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false //use autolayoure
        logoImageView.image = UIImage(named: "gh-logo")!
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor), //vertically center image in view
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func configureTextField() {
        view.addSubview(usernameTextField)
        usernameTextField.delegate = self //make sure to set the delegate so it can listen to this textfield
        
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 40),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configureCallToActionButton() {
        view.addSubview(callToActionButton)
        callToActionButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
}

extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerListVC()
        return true
    }
}
