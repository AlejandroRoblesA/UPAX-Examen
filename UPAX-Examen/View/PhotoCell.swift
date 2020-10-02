//
//  PhotoCell.swift
//  UPAX-Examen
//
//  Created by Alejandro on 01/10/20.
//  Copyright © 2020 Alejandro. All rights reserved.
//

import UIKit

class PhotoCell: UITableViewCell {
    
    //MARK: - Variables
    let photoImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .lightGray
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    //MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(photoImage)
        photoImage.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        photoImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        photoImage.widthAnchor.constraint(equalToConstant: 250).isActive = true
        photoImage.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        bottomAnchor.constraint(equalTo: photoImage.bottomAnchor, constant: 15).isActive = true
        
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
