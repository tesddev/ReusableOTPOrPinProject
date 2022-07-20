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
    private var walletPin = 0
    
    lazy var cancelButton: UIButton = {
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
    
    lazy var confirmButton: UIButton = {
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
    
    let codeTextField: OTPTextField = {
        let textField = OTPTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .systemBackground
        textField.configure()
        return textField
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        createTheView()
        activateConstraint()
        view.backgroundColor = .white
        codeTextField.didEnterLastDigit = { code in
            print(code)
            self.walletPin = Int(code) ?? 0
        }
    }
    
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
            
            codeTextField.topAnchor.constraint(equalTo: instruction2Label.bottomAnchor, constant: 25),
            codeTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            codeTextField.heightAnchor.constraint(equalToConstant: 80),
            codeTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            
            confirmButton.topAnchor.constraint(equalTo: codeTextField.bottomAnchor, constant: 80),
            confirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            confirmButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            confirmButton.heightAnchor.constraint(equalToConstant: 50),
            
        ])
    }
    
    
    private func createTheView() {
        view.addSubview(confirmButton)
        view.addSubview(instructionLabel)
        view.addSubview(instruction2Label)
        view.addSubview(codeTextField)
        view.addSubview(cancelButton)
    }
    
    @objc func didTapOkButton(_ sender: Any) {
        print("ok tapped")
        /// Do network calls to verify password before dismissing
        if walletPin == 1234 {
            print("good")
            self.dismiss(animated: true)
            delegate?.moveToNextViewController()
        } else {
            print("not good")
            self.codeTextField.paintRed()
        }
    }
    
    @objc func didTapCancelButton() {
        self.dismiss(animated: true)
    }
}

