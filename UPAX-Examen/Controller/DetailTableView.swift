//
//  DetailTableView.swift
//  UPAX-Examen
//
//  Created by Alejandro on 01/10/20.
//  Copyright © 2020 Alejandro. All rights reserved.
//

import UIKit

class DetailTableView: UITableViewController {
    
    //MARK: - Variables
    let photoCell  = "photoIdentifier"
    let dataCell   = "dataIdentifier"
    let phoneCell  = "phoneIdentifier"
    let nameCell   = "nameIdentifier"
    let genderCell = "genderIndetifier"
    let colorCell  = "colorIndetifier"
    
    let imageURL   = "https://http2.mlstatic.com/vegeta-tamano-real-para-armar-en-papercraft-D_NQ_NP_892880-MLA26232224460_102017-F.jpg"
    
    var model = [Model]()
    
    let genderArray = ["Masculino", "Femenino"]
    
    var colors: [Model] = [
        Model(title: "Rojo", isMarked: false),
        Model(title: "Amarillo", isMarked: false),
        Model(title: "Verde", isMarked: false),
        Model(title: "Azul", isMarked: false),
        Model(title: "Morado", isMarked: false)]

    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Seleccionados"
        
        tableView.register(PhotoCell.self,         forCellReuseIdentifier: photoCell)
        tableView.register(NameCell.self,          forCellReuseIdentifier: nameCell)
        tableView.register(PhoneNumberCell.self,   forCellReuseIdentifier: phoneCell)
        tableView.register(DataTextFieldCell.self, forCellReuseIdentifier: dataCell)
        tableView.register(GenderCell.self,        forCellReuseIdentifier: genderCell)
        tableView.register(ColorCell.self,         forCellReuseIdentifier: colorCell)
    }
    
    //MARK: - TableView
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return sections()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let array = sectionsTitle()
        
        if (array[section] == "Sexo (Masculino / Femenino)"){
            return genderArray.count
        }
        else if (array[section] == "Color Favorito"){
            return colors.count
        }
        else{
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let array = sectionsTitle()
        
        if (array[indexPath.section] == "Foto"){
            return photoCell(tableView: tableView, indexPath: indexPath)
        }
        else if (array[indexPath.section] == "Nombre Completo"){
            return nameCell(tableView:tableView, indexPath: indexPath)
        }
        else if (array[indexPath.section] == "Número telefónico"){
            return phoneNumberCell(tableView: tableView, indexPath: indexPath)
        }
        else if (array[indexPath.section] == "Fecha de nacimiento"){
            return datebirthCell(tableView: tableView, indexPath: indexPath)
        }
        else if (array[indexPath.section] == "Sexo (Masculino / Femenino)"){
            return genderCell(tableView: tableView, indexPath: indexPath)
        }
        else if (array[indexPath.section] == "Color Favorito"){
            return colorCell(tableView: tableView, indexPath: indexPath)
        }
        else{
            let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
            cell.textLabel?.text = "Abrir camara"
            return cell
        }
        
        
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let array = sectionsTitle()
        return array[section]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let cell = tableView.cellForRow(at: indexPath) as? ColorCell else { return }
        
        var array = colors[indexPath.row]
        array.isMarked = !array.isMarked
        colors.remove(at: indexPath.row)
        colors.insert(array, at: indexPath.row)
        
        cell.checkMarkButton.backgroundColor = array.isMarked && array.title == "Rojo" ? .red : array.isMarked && array.title == "Amarillo" ? .yellow : array.isMarked && array.title == "Verde" ? .green : array.isMarked && array.title == "Azul" ? .blue : array.isMarked && array.title == "Morado" ? .purple : .white
        
    }
    
    //MARK: - Functions
    func sections() -> Int {
        var sections = 0
        for array in model{
            if (array.isMarked == true){
                sections += 1
            }
        }
        return sections
    }
    
    func sectionsTitle() -> [String]{
        var array = [String]()
        var index = 0
        for model in model{
            if (model.isMarked == true){
                array.insert(model.title, at: index)
                index += 1
            }
        }
        return array
    }
    
    func photoCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: photoCell, for: indexPath) as! PhotoCell
        cell.photoImage.loadImageUsingCacheWithUrlString(urlString: imageURL)
        cell.selectionStyle = .none
        return cell
    }
    
    func nameCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: nameCell, for: indexPath) as! NameCell
        cell.selectionStyle = .none
        return cell
    }
    
    func phoneNumberCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: phoneCell, for: indexPath) as! PhoneNumberCell
        cell.selectionStyle = .none
        return cell
    }
    
    func datebirthCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: dataCell, for: indexPath) as! DataTextFieldCell
        cell.selectionStyle = .none
        return cell
    }
    
    func genderCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: genderCell, for: indexPath) as! GenderCell
        cell.genderLabel.text = genderArray[indexPath.row]
        return cell
    }
    func colorCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: colorCell, for: indexPath) as! ColorCell
        let array = colors[indexPath.row]
        cell.colorLabel.text = array.title
        cell.checkMarkButton.backgroundColor = array.isMarked && array.title == "Rojo" ? .red : array.isMarked && array.title == "Amarillo" ? .yellow : array.isMarked && array.title == "Verde" ? .green : array.isMarked && array.title == "Azul" ? .blue : array.isMarked && array.title == "Morado" ? .purple : .white
        cell.selectionStyle = .none
        return cell
    }
}
