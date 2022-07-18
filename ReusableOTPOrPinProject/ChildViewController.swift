//
//  ChildViewController.swift
//  ReusableOTPOrPinProject
//
//  Created by Tes on 18/07/2022.
//

import UIKit

protocol ChildViewControllerDelegate: AnyObject {
    func moveToNextViewController()
}

class ChildViewController: UIViewController {
    
    weak var delegate: ChildViewControllerDelegate?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        createTheView()
        activateConstraint()
        view.backgroundColor = .white
    }
    
    var cancelButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .black
        button.clipsToBounds = true
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        button.backgroundColor = .systemBackground
        button.addTarget(self, action: #selector(didTapCancelButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let instructionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Enter Wallet Pin"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    let instruction2Label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Kindly enter your wallet PIN to confirm your request"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    var okButton: UIButton = {
        let button = UIButton()
        button.setTitle("Confirm", for: .normal)
        button.clipsToBounds = true
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 1
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(didTapOkButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let categoryTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.backgroundColor = UIColor.white.cgColor
        textField.setPaddingPoints(20)
        textField.autocorrectionType = .no
        textField.isUserInteractionEnabled = false
        textField.addTarget(ChildViewController.self, action: #selector(textFieldDidChange), for: .editingChanged)
        return textField
    }()
    
    func activateConstraint() {
        NSLayoutConstraint.activate([
            
            cancelButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            cancelButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            cancelButton.widthAnchor.constraint(equalToConstant: 30),
            cancelButton.heightAnchor.constraint(equalToConstant: 30),
            
            instructionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            instructionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            instruction2Label.topAnchor.constraint(equalTo: instructionLabel.bottomAnchor, constant: 20),
            instruction2Label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            categoryTextField.topAnchor.constraint(equalTo: instruction2Label.bottomAnchor, constant: 25),
            categoryTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            categoryTextField.heightAnchor.constraint(equalToConstant: 100),
            categoryTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            
            okButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            okButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            okButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            okButton.heightAnchor.constraint(equalToConstant: 50),
            
        ])
    }
    
    
    private func createTheView() {
        
        view.addSubview(okButton)
        view.addSubview(instructionLabel)
        view.addSubview(instruction2Label)
        view.addSubview(categoryTextField)
        view.addSubview(cancelButton)
    }
    
    @objc func didTapOkButton(_ sender: Any) {
        print("ok tapped")
        delegate?.moveToNextViewController()
        self.dismiss(animated: true)
    }
    
    @objc func didTapCancelButton() {
        self.dismiss(animated: true)
    }
    
    @objc func textFieldDidChange() {
    }
}

extension UITextField {
    func setPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}

