//
//  OTPTextField.swift
//  ReusableOTPOrPinProject
//
//  Created by Tes on 19/07/2022.
//

import UIKit

class OTPTextField: UITextField {
    var digitLabels = [UILabel]()
    private var isConfigured = false
    var didEnterLastDigit: ((String)-> Void)?
    private lazy var tapRecognizer: UITapGestureRecognizer = {
        let recognizer = UITapGestureRecognizer()
        recognizer.addTarget(self, action: #selector(becomeFirstResponder))
        return recognizer
    }()
    
    func configure(with slotCount: Int = 4) {
        guard isConfigured == false else {return}
        isConfigured.toggle()
        
        configureTextField()
        
        addGestureRecognizer(tapRecognizer)
        
        let labelStackView = createLabelStackView(with: slotCount)
        addSubview(labelStackView)
        
        NSLayoutConstraint.activate([
            labelStackView.topAnchor.constraint(equalTo: topAnchor),
            labelStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            labelStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            labelStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func configureTextField(){
        tintColor = .clear
        textColor = .clear
        keyboardType = .numberPad
        textContentType = .oneTimeCode
        delegate = self

        DispatchQueue.main.async {
            self.isSecureTextEntry = true
        }
        addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    private func createLabelStackView(with count: Int) -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        
        for _ in 1...count{
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            label.backgroundColor = .systemGray6
            label.isUserInteractionEnabled = true
            label.layer.cornerRadius = 4
            
            stackView.addArrangedSubview(label)

            digitLabels.append(label)
        }
        
        return stackView
    }
    
    @objc private func textDidChange(){
        guard let text = self.text, text.count <= digitLabels.count else { return }
        
        for i in 0..<digitLabels.count{
            let currentLabel = digitLabels[i]

            if i  < text.count {
                let index = text.index(text.startIndex, offsetBy: i)
                currentLabel.text = String(text[index])
                currentLabel.hideInDots()

            } else {
                currentLabel.text?.removeAll()
            }
        }
        if text.count == digitLabels.count{
            didEnterLastDigit?(text)
        }
    }
}

extension OTPTextField: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let characterCount = textField.text?.count else { return false }
        return characterCount < digitLabels.count || string == ""
    }
}

extension OTPTextField: ValidationCheckDelegate {
    func paintRed() {
        digitLabels.forEach { label in
            label.textColor = .red
        }
    }
}

protocol ValidationCheckDelegate: AnyObject {
    func paintRed()
}

extension UILabel {
    func hideInDots(){
        self.font = UIFont.systemFont(ofSize: 80)
        self.text = "·"
    }
}
