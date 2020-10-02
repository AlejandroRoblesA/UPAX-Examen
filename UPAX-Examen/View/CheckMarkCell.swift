//
//  CheckMarkCell.swift
//  UPAX-Examen
//
//  Created by Alejandro on 01/10/20.
//  Copyright © 2020 Alejandro. All rights reserved.
//

import UIKit

class CheckMarkCell: UITableViewCell {
    
    //MARK: - Variables
    let fieldLabel: UILabel = {
        let label = UILabel()
        label.text = "Test Label"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let checkMarkButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(fieldLabel)
        fieldLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        fieldLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        fieldLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        fieldLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        addSubview(checkMarkButton)
        checkMarkButton.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        checkMarkButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        checkMarkButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        checkMarkButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        bottomAnchor.constraint(equalTo: fieldLabel.bottomAnchor, constant: 10).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
