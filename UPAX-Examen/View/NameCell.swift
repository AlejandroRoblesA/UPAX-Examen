//
//  NameCell.swift
//  UPAX-Examen
//
//  Created by Alejandro on 02/10/20.
//  Copyright © 2020 Alejandro. All rights reserved.
//

import UIKit

class NameCell: UITableViewCell {

    //MARK: - Variables
    let textField: UITextField = {
        let text = UITextField()
        text.textAlignment = .center
        text.layer.cornerRadius = 5
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor.gray.cgColor
        text.placeholder = "Escribe tu nombre"
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    //MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style:style, reuseIdentifier: reuseIdentifier)
        
        textField.delegate = self
        
        addSubview(textField)
        textField.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
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

}
//MARK: - Extension TextField
extension NameCell: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            let allowedCharacters = CharacterSet(charactersIn:"ABCDEFGHIJKLMNÑOPQRSTUVWXYZabcedefghijklmnopqrstuvwxyz ")
            let characterSet = CharacterSet(charactersIn: string)
            let currentString: NSString = textField.text! as NSString
            let maxLength = 35
            let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
            return  allowedCharacters.isSuperset(of: characterSet) && (newString.length <= maxLength)
    }
}
