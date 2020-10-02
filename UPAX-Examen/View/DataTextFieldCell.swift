//
//  DataTextFieldCell.swift
//  UPAX-Examen
//
//  Created by Alejandro on 02/10/20.
//  Copyright © 2020 Alejandro. All rights reserved.
//

import UIKit

class DataTextFieldCell: UITableViewCell {
    
    //MARK: - Variables
    let textField: UITextField = {
        let text = UITextField()
        text.textAlignment = .center
        text.layer.cornerRadius = 5
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor.gray.cgColor
        text.placeholder = "Selecciona"
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    //MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style:style, reuseIdentifier: reuseIdentifier)
        
        addSubview(textField)
        textField.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        textField.setInputViewDatePicker(target: self, selector: #selector(tapDone))
        
        bottomAnchor.constraint(equalTo: textField.bottomAnchor, constant: 15).isActive = true
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
    
    //MARK: - Functions
    @objc func tapDone() {
        if let datePicker = self.textField.inputView as? UIDatePicker {
            let dateformatter = DateFormatter()
            dateformatter.dateStyle = .medium
            self.textField.text = dateformatter.string(from: datePicker.date)
        }
        self.textField.resignFirstResponder()
    }

}
