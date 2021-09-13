//
//  ConfigView.swift
//  ByteCoinConverter
//
//  Created by F1xTeoNtTsS on 11.09.2021.
//

import UIKit

class ConfigView: UIView {

    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 50, weight: .thin)
        label.text = "ByteCoin"
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let convertLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .thin)
        label.text = "some text"
        label.textAlignment = .right
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let currencyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .thin)
        label.text = "USD"
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let byteCoinImage: UIImageView = {
        let coinImage = UIImageView()
        coinImage.image = UIImage(systemName: "bitcoinsign.circle.fill")
        coinImage.tintColor = .white
        coinImage.contentMode = .scaleAspectFill
        coinImage.translatesAutoresizingMaskIntoConstraints = false
        return coinImage
    }()
    
    let picker: UIPickerView = {
        let picker = UIPickerView()
        let color = UIColor.black
        picker.setValue(color, forKey: "textColor")
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    func setView(_ view: UIView){
        view.backgroundColor = UIColor(named: "backgroundColour")
        addSubview(view)
        setConstraintsAndStackView(view)
    }
    
    override func addSubview(_ view: UIView) {
        view.addSubview(titleLabel)
        view.addSubview(picker)
    }
    
    func setConstraintsAndStackView(_ view: UIView){
        let convertView = UIStackView(arrangedSubviews: [byteCoinImage,convertLabel,currencyLabel])
        view.addSubview(convertView)
        convertView.backgroundColor = #colorLiteral(red: 0.05309505016, green: 0.5728802085, blue: 0.5798966289, alpha: 1)
        convertView.layer.cornerRadius = 20
        convertView.translatesAutoresizingMaskIntoConstraints = false
        convertView.axis = .horizontal
        convertView.alignment = .center
        convertView.spacing = 10
        convertView.distribution = .fill
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                            constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            
            byteCoinImage.widthAnchor.constraint(equalToConstant: Constants.imageWidth),
            byteCoinImage.heightAnchor.constraint(equalToConstant: Constants.imageHeight),
            convertLabel.heightAnchor.constraint(equalToConstant: Constants.convertFieldHeight),
            convertLabel.widthAnchor.constraint(equalTo: convertView.widthAnchor,
                                                multiplier: Constants.convertFieldWidthMultiplier),
            currencyLabel.heightAnchor.constraint(equalToConstant: 30),
            convertView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            convertView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                            constant: 30),
            convertView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                  constant: Constants.trailingConstant),
            convertView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                                 constant: Constants.leadingConstant),
            convertView.heightAnchor.constraint(equalToConstant: Constants.stackViewHeight),
            picker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            picker.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            picker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            picker.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

enum Constants {
    static let trailingConstant: CGFloat = -10
    static let leadingConstant: CGFloat = 10
    static let imageWidth: CGFloat = 80
    static let imageHeight: CGFloat = 80
    static let stackViewHeight: CGFloat = 100
    static let convertFieldWidthMultiplier: CGFloat = 0.5
    static let convertFieldHeight: CGFloat = 100
}
