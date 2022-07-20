//
//  DetailViewController.swift
//  ReusableOTPOrPinProject
//
//  Created by Tes on 19/07/2022.
//

import UIKit

class DetailViewController: UIViewController {
    
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
    
    let contentView: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .systemGray6
        container.layer.cornerRadius = 10
        return container
    }()
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Stellas App Details"
        label.font = UIFont.systemFont(ofSize: 15)
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    let instructionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Log in to your Stellas App using the below details"
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 2
        label.textColor = .systemGray
        return label
    }()
    
    let accNoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Acc No:"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .systemGray
        return label
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Email"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .systemGray
        return label
    }()
    
    let passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Password"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .systemGray
        return label
    }()
    
    let theAccLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "xxxxxxxxxx"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    let theEmailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "xxx@gmail.com"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    let thePasswordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Password"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    lazy var copyAccButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "clone"), for: .normal)
        button.addTarget(self, action: #selector(didTapCopyAccountButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImageTintColor(#colorLiteral(red: 0.8941177726, green: 0.8941177726, blue: 0.8941177726, alpha: 1))
        return button
    }()
    
    lazy var copyEmailButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "clone"), for: .normal)
        button.addTarget(self, action: #selector(didTapCopyEmailButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImageTintColor(#colorLiteral(red: 0.8941177726, green: 0.8941177726, blue: 0.8941177726, alpha: 1))
        return button
    }()
    
    lazy var copyPasswordButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "clone"), for: .normal)
        button.tintColor = .systemGray4
        button.setTitleColor(UIColor.systemGray2, for: .normal)
        button.addTarget(self, action: #selector(didTapCopyPasswordButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImageTintColor(#colorLiteral(red: 0.8941177726, green: 0.8941177726, blue: 0.8941177726, alpha: 1))
        return button
    }()
    
    lazy var downloadAppButton: UIButton = {
        let button = UIButton()
        button.setTitle("Download Stellas App", for: .normal)
        button.clipsToBounds = true
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 1
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(didTapDownloadButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Close", for: .normal)
        button.clipsToBounds = true
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        button.layer.cornerRadius = 4
        button.backgroundColor = .white
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(didTapCancelButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        activateConstraint()
    }
    
    func activateConstraint() {
        
        view.addSubview(contentView)
        contentView.addSubview(instructionLabel)
        contentView.addSubview(headerLabel)
        contentView.addSubview(accNoLabel)
        contentView.addSubview(theAccLabel)
        contentView.addSubview(emailLabel)
        contentView.addSubview(theEmailLabel)
        contentView.addSubview(passwordLabel)
        contentView.addSubview(thePasswordLabel)
        contentView.addSubview(copyAccButton)
        contentView.addSubview(copyEmailButton)
        contentView.addSubview(copyPasswordButton)
        view.addSubview(cancelButton)
        view.addSubview(downloadAppButton)
        view.addSubview(closeButton)
        
        NSLayoutConstraint.activate([
            
            cancelButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            cancelButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            cancelButton.widthAnchor.constraint(equalToConstant: 30),
            cancelButton.heightAnchor.constraint(equalToConstant: 30),
            
            contentView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            contentView.topAnchor.constraint(equalTo: cancelButton.bottomAnchor, constant: 40),
            contentView.heightAnchor.constraint(equalToConstant: 272),
            
            headerLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            headerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            instructionLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 20),
            instructionLabel.leadingAnchor.constraint(equalTo: headerLabel.leadingAnchor),
            
            accNoLabel.topAnchor.constraint(equalTo: instructionLabel.bottomAnchor, constant: 20),
            accNoLabel.leadingAnchor.constraint(equalTo: headerLabel.leadingAnchor),
            
            emailLabel.topAnchor.constraint(equalTo: accNoLabel.bottomAnchor, constant: 20),
            emailLabel.leadingAnchor.constraint(equalTo: accNoLabel.leadingAnchor),
            
            theAccLabel.topAnchor.constraint(equalTo: accNoLabel.topAnchor),
            theAccLabel.trailingAnchor.constraint(equalTo: copyAccButton.leadingAnchor, constant: -5),
            
            theEmailLabel.topAnchor.constraint(equalTo: emailLabel.topAnchor),
            theEmailLabel.trailingAnchor.constraint(equalTo: theAccLabel.trailingAnchor),
            
            thePasswordLabel.topAnchor.constraint(equalTo: passwordLabel.topAnchor),
            thePasswordLabel.trailingAnchor.constraint(equalTo: theAccLabel.trailingAnchor),
            
            passwordLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 20),
            passwordLabel.leadingAnchor.constraint(equalTo: accNoLabel.leadingAnchor),
            
            copyAccButton.topAnchor.constraint(equalTo: accNoLabel.topAnchor),
            copyAccButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            copyAccButton.widthAnchor.constraint(equalToConstant: 20),
            copyAccButton.heightAnchor.constraint(equalToConstant: 20),
            
            copyEmailButton.topAnchor.constraint(equalTo: emailLabel.topAnchor),
            copyEmailButton.trailingAnchor.constraint(equalTo: copyAccButton.trailingAnchor),
            copyEmailButton.widthAnchor.constraint(equalToConstant: 20),
            copyEmailButton.heightAnchor.constraint(equalToConstant: 20),
            
            copyPasswordButton.topAnchor.constraint(equalTo: passwordLabel.topAnchor),
            copyPasswordButton.trailingAnchor.constraint(equalTo: copyAccButton.trailingAnchor),
            copyPasswordButton.widthAnchor.constraint(equalToConstant: 20),
            copyPasswordButton.heightAnchor.constraint(equalToConstant: 20),
            
            downloadAppButton.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 30),
            downloadAppButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            downloadAppButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            downloadAppButton.heightAnchor.constraint(equalToConstant: 50),
            
            closeButton.topAnchor.constraint(equalTo: downloadAppButton.bottomAnchor, constant: 20),
            closeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            closeButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            closeButton.heightAnchor.constraint(equalToConstant: 50),
            
        ])
    }
    
    @objc func didTapCancelButton() {
        self.dismiss(animated: true)
    }
    
    @objc func didTapDownloadButton() {
        if let url = URL(string: "https://apps.apple.com/ng/app/stellas-bank-anonymously/id1592332069") {
            UIApplication.shared.open(url)
        }
    }
    
    @objc func didTapCopyAccountButton() {
        UIPasteboard.general.string = theAccLabel.text
    }
    
    @objc func didTapCopyEmailButton() {
        UIPasteboard.general.string = theEmailLabel.text
    }
    
    @objc func didTapCopyPasswordButton() {
        UIPasteboard.general.string = thePasswordLabel.text
    }

}

extension UIButton{

    func setImageTintColor(_ color: UIColor) {
        let tintedImage = self.imageView?.image?.withRenderingMode(.alwaysTemplate)
        self.setImage(tintedImage, for: .normal)
        self.tintColor = color
    }

}
