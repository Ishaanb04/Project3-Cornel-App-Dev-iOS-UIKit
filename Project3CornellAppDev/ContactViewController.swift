//
//  ContactViewController.swift
//  Project3CornellAppDev
//
//  Created by Ishaan Bhasin on 2/15/23.
//

import UIKit

class ContactViewController: UIViewController {

    var nameLabel = UILabel()
    var nameTextField = TextFieldWithPadding()
    var portfolioLabel = UILabel()
    var portfolioTextfield = TextFieldWithPadding()
    var yearLabel = UILabel()
    var yearSlider = UISlider()
    var aboutLabel = UILabel()
    var aboutTextField = TextFieldWithPadding()
    
    var currentName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Edit My Profile"
        view.backgroundColor = .white
        
        nameLabel.text = "NAME"
        nameLabel.textColor = UIColor(red: 0.708, green: 0.708, blue: 0.708, alpha: 1)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        
        
        nameTextField.placeholder = currentName
        nameTextField.layer.cornerRadius = 25
        nameTextField.backgroundColor =  UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        nameTextField.clipsToBounds = true
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameTextField)
        
        portfolioLabel.text = "PORTFOLIO"
        portfolioLabel.textColor = UIColor(red: 0.708, green: 0.708, blue: 0.708, alpha: 1)
        portfolioLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(portfolioLabel)
        
        portfolioTextfield.placeholder = currentName
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
        yearSlider.addTarget(self, action: #selector(self.sliderValueDidChange(_:)), for: .valueChanged)
        yearSlider.isContinuous = false
        yearSlider.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        yearSlider.tintColor = UIColor(red: 0.708, green: 0.708, blue: 0.708, alpha: 1)
        yearSlider.translatesAutoresizingMaskIntoConstraints = false
        yearSlider.layer.cornerRadius = 25
        view.addSubview(yearSlider)
        
        setUpConstraints()
    }
    
    @objc func sliderValueDidChange(_ sender:UISlider!)
    {
        print("Slider value changed")
        
        // Use this code below only if you want UISlider to snap to values step by step
        let roundedStepValue = round(sender.value / 1) * 1
        sender.value = roundedStepValue
        
        print("Slider step value \(Int(roundedStepValue))")
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 35),
            nameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
           nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
           nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
           nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
           nameTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
           portfolioLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 25),
           portfolioLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
           portfolioLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 35),
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
            yearLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            yearLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 35),
            yearLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            yearSlider.topAnchor.constraint(equalTo: yearLabel.bottomAnchor, constant: 5),
            yearSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            yearSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            yearSlider.heightAnchor.constraint(equalToConstant: 50)
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
