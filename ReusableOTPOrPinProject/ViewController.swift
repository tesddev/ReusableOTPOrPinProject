//
//  ViewController.swift
//  ReusableOTPOrPinProject
//
//  Created by Tes on 18/07/2022.
//

import UIKit

class ViewController: UIViewController, ChildViewControllerDelegate {
    
    lazy var okButton: UIButton = {
        let button = UIButton()
        button.setTitle("Ok", for: .normal)
        button.clipsToBounds = true
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 1
        button.backgroundColor = .systemGray
        button.addTarget(self, action: #selector(didTapOkButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        activateConstraint()
    }
    
    func activateConstraint() {
        view.addSubview(okButton)
        NSLayoutConstraint.activate([
            
            okButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            okButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            okButton.widthAnchor.constraint(equalToConstant: 60),
            okButton.heightAnchor.constraint(equalToConstant: 30)
            
        ])
    }
    
    @objc func didTapOkButton(_ sender: Any) {
        print("ok tapped")
        let vc = ChildViewController()
        vc.delegate = self
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 30
        }
        self.present(vc, animated: true)
    }
    
    func moveToNextViewController() {
        let vc = DetailViewController()
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 30
        }
        self.present(vc, animated: true)
    }
    
}

