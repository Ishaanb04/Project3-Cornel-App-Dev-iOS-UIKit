//
//  ContactViewController.swift
//  Project3CornellAppDev
//
//  Created by Ishaan Bhasin on 2/15/23.
//

import UIKit

class ContactViewController: UIViewController {
    
    weak var del: EditProfileDelegate?
    
    var nameLabel = UILabel()
    var nameTextField = TextFieldWithPadding()
    var portfolioLabel = UILabel()
    var portfolioTextfield = TextFieldWithPadding()
    var yearLabel = UILabel()
    var yearSlider = UISlider()
    var currentYear = UILabel()
    var aboutLabel = UILabel()
    var aboutTextField = UITextView()
    
    var currentName: String
    var currentPortFolio: String
    var currentAbout: String
    var currentYearValue: Int
    
    init(del: EditProfileDelegate, currentName: String = "", currentPortFolio: String = "", currentAbout: String = "", currentYearValue: Int = 1) {
        self.currentName = currentName
        self.currentPortFolio = currentPortFolio
        self.currentAbout = currentAbout
        self.currentYearValue = currentYearValue
        self.del = del
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Edit My Profile"
        view.backgroundColor = .white
        
        nameLabel.text = "NAME"
        nameLabel.textColor = UIColor(red: 0.708, green: 0.708, blue: 0.708, alpha: 1)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        
        
        nameTextField.placeholder = currentName == "" ? currentName : "Enter Your Name"
        nameTextField.text = currentName
        nameTextField.layer.cornerRadius = 25
        nameTextField.backgroundColor =  UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        nameTextField.clipsToBounds = true
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameTextField)
        
        portfolioLabel.text = "PORTFOLIO"
        portfolioLabel.textColor = UIColor(red: 0.708, green: 0.708, blue: 0.708, alpha: 1)
        portfolioLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(portfolioLabel)
        
        portfolioTextfield.placeholder = currentPortFolio == "" ? currentPortFolio : "Enter Your Portfolio"
        portfolioTextfield.text = currentPortFolio
        portfolioTextfield.layer.cornerRadius = 25
        portfolioTextfield.backgroundColor =  UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        portfolioTextfield.clipsToBounds = true
        portfolioTextfield.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(portfolioTextfield)
        
        yearLabel.text = "YEAR"
        yearLabel.textColor = UIColor(red: 0.708, green: 0.708, blue: 0.708, alpha: 1)
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(yearLabel)
        
        yearSlider.minimumValue = 1
        yearSlider.maximumValue = 5
        yearSlider.value = Float(currentYearValue)
        yearSlider.addTarget(self, action: #selector(self.sliderValueDidChange(_:)), for: .valueChanged)
        yearSlider.isContinuous = false
        yearSlider.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        yearSlider.tintColor = UIColor(red: 0.708, green: 0.708, blue: 0.708, alpha: 1)
        yearSlider.translatesAutoresizingMaskIntoConstraints = false
        yearSlider.layer.cornerRadius = 25
        view.addSubview(yearSlider)
        
        switch currentYearValue{
        case 1:
            currentYear.text = "Freshmen"
        case 2:
            currentYear.text = "Sophomore"
        case 3:
            currentYear.text = "Junior"
        case 4:
            currentYear.text = "Senior"
        case 5:
            currentYear.text = "Super Senior"
        default:
            currentYear.text = "Freshmen"
        }
        currentYear.translatesAutoresizingMaskIntoConstraints = false
        currentYear.font = UIFont(name: "Roboto-Regular", size: 12)
        currentYear.textColor = UIColor(red: 0.708, green: 0.708, blue: 0.708, alpha: 1)
        view.addSubview(currentYear)
        
        aboutLabel.text = "ABOUT"
        aboutLabel.textColor = UIColor(red: 0.708, green: 0.708, blue: 0.708, alpha: 1)
        aboutLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(aboutLabel)
        aboutTextField.text = currentAbout
        aboutTextField.layer.cornerRadius = 25
        aboutTextField.backgroundColor =  UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        aboutTextField.contentInset = UIEdgeInsets(top: 10, left: 25, bottom: 10, right: 25)
        aboutTextField.font = UIFont(name: "Roboto-Regular", size: 12)
        aboutTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(aboutTextField)
        
        let savebutton = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveAndExit))
        self.navigationItem.rightBarButtonItem = savebutton
        setUpConstraints()
    }
    
    @objc func saveAndExit(){
        del?.changeYear(val: currentYearValue)
        del?.changeName(str: nameTextField.text ?? "")
        del?.changePortfolio(str: portfolioTextfield.text ?? "")
        del?.aboutFunc(str: aboutTextField.text ?? "")
        navigationController?.popViewController(animated: true)
    }
    
    @objc func sliderValueDidChange(_ sender:UISlider!)
    {
        
        // Use this code below only if you want UISlider to snap to values step by step
        let roundedStepValue = round(sender.value / 1) * 1
        sender.value = roundedStepValue
        
        currentYearValue = Int(roundedStepValue)
        switch roundedStepValue{
            
        case 1:
            currentYear.text = "Freshmen"
        case 2:
            currentYear.text = "Sophomore"
        case 3:
            currentYear.text = "Junior"
        case 4:
            currentYear.text = "Senior"
        case 5:
            currentYear.text = "Super Senior"
        default:
            currentYear.text = "Freshmen"
        }
        
        
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            nameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            nameTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            portfolioLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 25),
            portfolioLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            portfolioLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            portfolioLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            portfolioTextfield.topAnchor.constraint(equalTo: portfolioLabel.bottomAnchor, constant: 5),
            portfolioTextfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            portfolioTextfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            portfolioTextfield.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            yearLabel.topAnchor.constraint(equalTo: portfolioTextfield.bottomAnchor, constant: 25),
            yearLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            yearLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            yearLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            yearSlider.topAnchor.constraint(equalTo: yearLabel.bottomAnchor, constant: 5),
            yearSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            yearSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            yearSlider.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            currentYear.topAnchor.constraint(equalTo: yearSlider.bottomAnchor, constant: 5),
            currentYear.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            currentYear.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            aboutLabel.topAnchor.constraint(equalTo: currentYear.topAnchor, constant: 25),
            aboutLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            aboutLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            aboutLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            aboutTextField.topAnchor.constraint(equalTo: aboutLabel.bottomAnchor, constant: 5),
            aboutTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            aboutTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            aboutTextField.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 10)
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
    
}

class TextFieldWithPadding: UITextField{
    var customPadding = UIEdgeInsets(top: 12, left: 30, bottom: 12, right: 30)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: customPadding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: customPadding)
    }
}


protocol EditProfileDelegate: UIViewController{
    func changeName(str: String)
    func changePortfolio(str: String)
    func changeYear(val: Int)
    func aboutFunc(str: String)
}
