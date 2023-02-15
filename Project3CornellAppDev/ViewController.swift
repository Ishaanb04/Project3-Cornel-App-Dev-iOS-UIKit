//
//  ViewController.swift
//  Project3CornellAppDev
//
//  Created by Ishaan Bhasin on 2/14/23.
//

import UIKit

class ViewController: UIViewController {
    
    var profilePicture = UIImageView()
    var profilepictureMask = UIImageView()
    var nameLabel = UILabel()
    var portfolioLabel = UILabel()
    var yearLabel = UILabel()
    var year = UILabel()
    var aboutLabel = UILabel()
    var about = UITextView()
    var imageName = ["Avatar1", "Avatar2", "Avatar3", "Avatar4", "Avatar5", "Avatar6"]
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Profile"
        view.backgroundColor = .white
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        profilePicture.isUserInteractionEnabled = true
        profilePicture.addGestureRecognizer(tapGestureRecognizer)
        
        let profileImage = UIImage(named: imageName[currentIndex])
        profilePicture.image = profileImage
        profilePicture.clipsToBounds = true
        profilepictureMask.layer.borderWidth = 5
        profilepictureMask.layer.borderColor = UIColor(red: 0.708, green: 0.708, blue: 0.708, alpha: 1).cgColor
        profilepictureMask.translatesAutoresizingMaskIntoConstraints = false
        profilePicture.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(profilePicture)
        view.addSubview(profilepictureMask)
        setUpConstraints()
        
        
    }
    
    override func viewDidLayoutSubviews() {
        profilepictureMask.layer.cornerRadius = profilepictureMask.bounds.height/2
        
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            profilePicture.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            profilePicture.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profilePicture.heightAnchor.constraint(equalToConstant: 200),
            profilePicture.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            profilepictureMask.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            profilepictureMask.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profilepictureMask.heightAnchor.constraint(equalToConstant: 220),
            profilepictureMask.widthAnchor.constraint(equalToConstant: 220)
        ])
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        _ = tapGestureRecognizer.view as! UIImageView

        // Your action
        let ProfilePictureVC = ProfilePictureViewController(delegate: self, currentIndex: currentIndex)
        present(ProfilePictureVC, animated: true, completion: nil)
    }
}

extension ViewController: MainImageChangeDelgate{
    func changeMainImage(index: Int) {
        currentIndex = index
        profilePicture.image = UIImage(named: imageName[index])
    }
}
