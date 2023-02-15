//
//  ProfilePictureViewController.swift
//  Project3CornellAppDev
//
//  Created by Ishaan Bhasin on 2/15/23.
//

import UIKit

class ProfilePictureViewController: UIViewController {
    
    enum Selected{
        case i1
        case i2
        case i3
        case i4
        case i5
        case i6
        case none
    }
    weak var delegate: MainImageChangeDelgate?
    var currentIndex: Int
    init(delegate: MainImageChangeDelgate, currentIndex: Int = 0) {
        self.delegate = delegate
        self.currentIndex = currentIndex
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var mainPicture = UIImageView()
    var mainPictureMast = UIImageView()
    var imageBackGround = UIImageView()
    var imageList: [UIImageView] = []
    var imageName = ["Avatar1", "Avatar2", "Avatar3", "Avatar4", "Avatar5", "Avatar6"]
    var currentSelection: Selected = .none
    @objc var saveButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        title = "Change My Profile"
        view.backgroundColor = .white
        imageBackGround.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        let profileImage = UIImage(named: imageName[currentIndex])
        mainPicture.image = profileImage
        mainPicture.clipsToBounds = true
        mainPictureMast.layer.borderWidth = 5
        mainPictureMast.layer.borderColor = UIColor(red: 0.708, green: 0.708, blue: 0.708, alpha: 1).cgColor
        mainPictureMast.translatesAutoresizingMaskIntoConstraints = false
        mainPicture.translatesAutoresizingMaskIntoConstraints = false
        imageBackGround.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        for image in imageName{
            let imageView = UIImageView()
            imageView.image = UIImage(named: "\(image)")
            imageView.clipsToBounds = true
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.layer.borderWidth = 5
            imageView.layer.borderColor =  UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
            view.addSubview(imageView)
            imageList.append(imageView)
        }
        
        let tapGestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(tapped1(tapGestureRecognizer:)))
        imageList[0].isUserInteractionEnabled = true
        imageList[0].addGestureRecognizer(tapGestureRecognizer1)
        
        let tapGestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(tapped2(tapGestureRecognizer:)))
        imageList[1].isUserInteractionEnabled = true
        imageList[1].addGestureRecognizer(tapGestureRecognizer2)
        
        let tapGestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(tapped3(tapGestureRecognizer:)))
        imageList[2].isUserInteractionEnabled = true
        imageList[2].addGestureRecognizer(tapGestureRecognizer3)
        
        let tapGestureRecognizer4 = UITapGestureRecognizer(target: self, action: #selector(tapped4(tapGestureRecognizer:)))
        imageList[3].isUserInteractionEnabled = true
        imageList[3].addGestureRecognizer(tapGestureRecognizer4)
        
        let tapGestureRecognizer5 = UITapGestureRecognizer(target: self, action: #selector(tapped5(tapGestureRecognizer:)))
        imageList[4].isUserInteractionEnabled = true
        imageList[4].addGestureRecognizer(tapGestureRecognizer5)
        
        let tapGestureRecognizer6 = UITapGestureRecognizer(target: self, action: #selector(tapped6(tapGestureRecognizer:)))
        imageList[5].isUserInteractionEnabled = true
        imageList[5].addGestureRecognizer(tapGestureRecognizer6)
        
        
        view.addSubview(imageBackGround)
        view.addSubview(mainPicture)
        view.addSubview(mainPictureMast)
        
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(UIColor(red: 0.47, green: 0.221, blue: 1, alpha: 1), for: .normal)
        saveButton.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(saveButton)
        
        setUpConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        mainPictureMast.layer.cornerRadius = mainPictureMast.bounds.height/2
        for imageV in imageList{
            imageV.layer.cornerRadius = imageV.bounds.height/2
        }
    }
    
    @objc func saveButtonPressed(){
        switch currentSelection{
        case .i1:
            delegate?.changeMainImage(index: 0)
        case .i2:
            delegate?.changeMainImage(index: 1)
        case .i3:
            delegate?.changeMainImage(index: 2)
        case .i4:
            delegate?.changeMainImage(index: 3)
        case .i5:
            delegate?.changeMainImage(index: 4)
        case .i6:
            delegate?.changeMainImage(index: 5)
        case .none:
            delegate?.changeMainImage(index: 0)
        }
        dismiss(animated: true, completion: nil)
    }
    
    func setUpConstraints(){
        
        NSLayoutConstraint.activate([
            saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.widthAnchor.constraint(equalToConstant: view.bounds.width / 2)
            
        ])
        
        NSLayoutConstraint.activate([
            mainPicture.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            mainPicture.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainPicture.heightAnchor.constraint(equalToConstant: 200),
            mainPicture.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            mainPictureMast.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            mainPictureMast.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainPictureMast.heightAnchor.constraint(equalToConstant: 220),
            mainPictureMast.widthAnchor.constraint(equalToConstant: 220)
        ])
        
        NSLayoutConstraint.activate([
            imageBackGround.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageBackGround.widthAnchor.constraint(equalTo: view.widthAnchor),
            imageBackGround.heightAnchor.constraint(equalToConstant: view.bounds.height / 3),
            mainPictureMast.heightAnchor.constraint(equalToConstant: 220),
            mainPictureMast.widthAnchor.constraint(equalToConstant: 220)
        ])
        
        NSLayoutConstraint.activate([
            imageList[0].topAnchor.constraint(equalTo: imageBackGround.bottomAnchor, constant: 40),
            imageList[0].leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            imageList[0].heightAnchor.constraint(equalToConstant: 80),
            imageList[0].widthAnchor.constraint(equalToConstant: 80)
        ])
        
        NSLayoutConstraint.activate([
            imageList[1].topAnchor.constraint(equalTo: imageBackGround.bottomAnchor, constant: 40),
            imageList[1].trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            imageList[1].heightAnchor.constraint(equalToConstant: 80),
            imageList[1].widthAnchor.constraint(equalToConstant: 80)
        ])
        
        NSLayoutConstraint.activate([
            imageList[2].topAnchor.constraint(equalTo: imageList[1].bottomAnchor, constant: 40),
            imageList[2].leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            imageList[2].heightAnchor.constraint(equalToConstant: 80),
            imageList[2].widthAnchor.constraint(equalToConstant: 80)
        ])
        
        NSLayoutConstraint.activate([
            imageList[3].topAnchor.constraint(equalTo: imageList[1].bottomAnchor, constant: 40),
            imageList[3].trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            imageList[3].heightAnchor.constraint(equalToConstant: 80),
            imageList[3].widthAnchor.constraint(equalToConstant: 80)
        ])
        
        NSLayoutConstraint.activate([
            imageList[4].topAnchor.constraint(equalTo: imageList[3].bottomAnchor, constant: 40),
            imageList[4].leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            imageList[4].heightAnchor.constraint(equalToConstant: 80),
            imageList[4].widthAnchor.constraint(equalToConstant: 80)
        ])
        
        NSLayoutConstraint.activate([
            imageList[5].topAnchor.constraint(equalTo: imageList[3].bottomAnchor, constant: 40),
            imageList[5].trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            imageList[5].heightAnchor.constraint(equalToConstant: 80),
            imageList[5].widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    @objc func tapped1(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        // Your action
        currentSelection = tapMod(theView: tappedImage, sel: currentSelection, iName: imageName[0], main: mainPicture, fromView: .i1)
        
    }
    
    @objc func tapped2(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        currentSelection = tapMod(theView: tappedImage, sel: currentSelection, iName: imageName[1], main: mainPicture, fromView: .i2)
        
    }
    
    @objc func tapped3(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        currentSelection = tapMod(theView: tappedImage, sel: currentSelection, iName: imageName[2], main: mainPicture, fromView: .i3)
        
    }
    
    @objc func tapped4(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        currentSelection = tapMod(theView: tappedImage, sel: currentSelection, iName: imageName[3], main: mainPicture, fromView: .i4)
        
    }
    @objc func tapped5(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        currentSelection = tapMod(theView: tappedImage, sel: currentSelection, iName: imageName[4], main: mainPicture, fromView: .i5)
        
    }
    
    @objc func tapped6(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        currentSelection = tapMod(theView: tappedImage, sel: currentSelection, iName: imageName[5], main: mainPicture, fromView: .i6)
        
    }
    
    func tapMod(theView: UIImageView, sel: Selected, iName: String, main: UIImageView, fromView: Selected) -> Selected{
        var selected = sel
        if selected == .none {
            selected = fromView
            theView.layer.borderColor = UIColor(red: 0.708, green: 0.708, blue: 0.708, alpha: 1).cgColor
            main.image = UIImage(named: iName)
            return selected
        }else if selected != fromView{
            selected = fromView
            NullifySelection(theList: imageList)
            theView.layer.borderColor = UIColor(red: 0.708, green: 0.708, blue: 0.708, alpha: 1).cgColor
            main.image = UIImage(named: iName)
            return selected
        } else{
            selected = .none
            theView.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
            return selected
        }
        
        
        
        
    }
    
    func NullifySelection(theList: [UIImageView]){
        for imageV in theList{                imageV.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        }
    }
}

protocol MainImageChangeDelgate: UIViewController{
    func changeMainImage(index: Int)
}

