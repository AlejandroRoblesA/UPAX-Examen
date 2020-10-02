//
//  GenderCell.swift
//  UPAX-Examen
//
//  Created by Alejandro on 02/10/20.
//  Copyright © 2020 Alejandro. All rights reserved.
//

import UIKit

class GenderCell: UITableViewCell {
    
    //MARK: - Variables
    let genderLabel: UILabel = {
        let label = UILabel()
        label.text = "Gender"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    //MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(genderLabel)
        genderLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        genderLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        genderLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        genderLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        bottomAnchor.constraint(equalTo: genderLabel.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
