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
    
    var currentName = "Jamie Gonzalez   "
    var currentPortFolio = "https://jamiegonzalez.me"
    var currentYear = 1
    var currentAbout = "Hi I’m Jamie and I enjoy skiing, sledding, and squirrel watching."
    
    var editbutton = UIButton()
    
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
        
        editbutton.setTitle("EDIT MY PROFILE >", for: .normal)
        editbutton.setTitleColor(UIColor(red: 0.47, green: 0.221, blue: 1, alpha: 1), for: .normal)
        editbutton.titleLabel?.font = UIFont(name: "Roboto-Bold", size: 12)
        editbutton.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
        editbutton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(editbutton)
        
        nameLabel.text = currentName
        nameLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        nameLabel.font = UIFont(name: "Roboto-Regular", size: 24)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        
        portfolioLabel.text = currentPortFolio
        portfolioLabel.textColor = UIColor(red: 0.708, green: 0.708, blue: 0.708, alpha: 1)
        portfolioLabel.font = UIFont(name: "Roboto-Regular", size: 12)
        portfolioLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(portfolioLabel)
        
        yearLabel.text = "YEAR"
        yearLabel.textColor = UIColor(red: 0.708, green: 0.708, blue: 0.708, alpha: 1)
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(yearLabel)
        
        switch currentYear{
        case 1:
            year.text = "Freshmen"
        case 2:
            year.text = "Sophomore"
        case 3:
            year.text = "Junior"
        case 4:
            year.text = "Senior"
        case 5:
            year.text = "Super Senior"
        default:
            year.text = "Freshmen"
        }
        year.translatesAutoresizingMaskIntoConstraints = false
        year.font = UIFont(name: "Roboto-Regular", size: 12)
        year.textAlignment = .center
        year.textColor = UIColor(red: 0.708, green: 0.708, blue: 0.708, alpha: 1)
        view.addSubview(year)
        
        aboutLabel.text = "ABOUT"
        aboutLabel.textColor = UIColor(red: 0.708, green: 0.708, blue: 0.708, alpha: 1)
        aboutLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(aboutLabel)
        
        about.layer.cornerRadius = 25
        about.backgroundColor =  UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        about.contentInset = UIEdgeInsets(top: 10, left: 25, bottom: 10, right: 25)
        about.font = UIFont(name: "Roboto-Regular", size: 16)
        about.textColor = UIColor(red: 0.708, green: 0.708, blue: 0.708, alpha: 1)
        about.text = currentAbout
        about.translatesAutoresizingMaskIntoConstraints = false
        about.isEditable = false
        view.addSubview(about)
        
        setUpConstraints()
        
        
    }
    
    override func viewDidLayoutSubviews() {
        profilepictureMask.layer.cornerRadius = profilepictureMask.bounds.height/2
        
    }
    
    @objc func editButtonTapped(){
        navigationController?.pushViewController(ContactViewController(del: self, currentName: currentName, currentPortFolio: currentPortFolio, currentAbout: currentAbout, currentYearValue: currentYear), animated: true)
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            profilePicture.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            profilePicture.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profilePicture.heightAnchor.constraint(equalToConstant: 200),
            profilePicture.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            profilepictureMask.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            profilepictureMask.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profilepictureMask.heightAnchor.constraint(equalToConstant: 220),
            profilepictureMask.widthAnchor.constraint(equalToConstant: 220)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: profilepictureMask.bottomAnchor, constant: 10),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            portfolioLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            portfolioLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            portfolioLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            yearLabel.topAnchor.constraint(equalTo: portfolioLabel.bottomAnchor, constant: 20),
            yearLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            yearLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            yearLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            year.topAnchor.constraint(equalTo: yearLabel.bottomAnchor, constant: 5),
            year.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            year.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            year.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            aboutLabel.topAnchor.constraint(equalTo: year.bottomAnchor, constant: 25),
            aboutLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            aboutLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            aboutLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            about.topAnchor.constraint(equalTo: aboutLabel.bottomAnchor, constant: 5),
            about.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            about.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            about.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -60)
        ])
        
        NSLayoutConstraint.activate([
            editbutton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            editbutton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
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

extension ViewController: EditProfileDelegate {
    func aboutFunc(str: String) {
        currentAbout = str
        about.text = str
    }
    
    func changeName(str: String) {
        currentName = str
        nameLabel.text = str
    }
    
    func changePortfolio(str: String) {
        currentPortFolio = str
        portfolioLabel.text = str
    }
    
    func changeYear(val: Int) {
        currentYear = val
        switch currentYear{
        case 1:
            year.text = "Freshmen"
        case 2:
            year.text = "Sophomore"
        case 3:
            year.text = "Junior"
        case 4:
            year.text = "Senior"
        case 5:
            year.text = "Super Senior"
        default:
            year.text = "Freshmen"
        }
    }
    
}

