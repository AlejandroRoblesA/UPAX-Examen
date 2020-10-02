//
//  ViewController.swift
//  UPAX-Examen
//
//  Created by Alejandro on 01/10/20.
//  Copyright © 2020 Alejandro. All rights reserved.
//

import UIKit

//MARK: - ViewController
class ViewController: UIViewController {
    
    //MARK: - Variables
    let cellId = "cellIdentifier"
    
    var model: [Model] = [
        Model(title: "Cámara", isMarked: false),
        Model(title: "Foto", isMarked: false),
        Model(title: "Nombre Completo", isMarked: false),
        Model(title: "Número telefónico", isMarked: false),
        Model(title: "Fecha de nacimiento", isMarked: false),
        Model(title: "Sexo (Masculino / Femenino)", isMarked: false),
        Model(title: "Color Favorito", isMarked: false)]
    
    let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Siguiente", for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 15
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "UPAX Test"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(CheckMarkCell.self, forCellReuseIdentifier: cellId)
        
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80).isActive = true
        
        view.addSubview(nextButton)
        nextButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 10).isActive = true
        nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    //MARK: - Functions
    @objc func handleNext(){
        
        if (atLestAnItemIsSelected()){
            let controller = DetailTableView()
            controller.model = model
            navigationController?.pushViewController(controller, animated: true)
        }
        else{
            alert()
        }
    }
    
    func alert(){
        let alert = UIAlertController(title: "¡Alerta!", message: "Por lo menos debes seleccionar una opción", preferredStyle: .alert)
        let action = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    func atLestAnItemIsSelected() -> Bool {
        for array in model{
            if (array.isMarked == true){
                return true
            }
        }
        return false
    }
}

//MARK: - Extension ViewController
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CheckMarkCell
        let array = model[indexPath.row]
        cell.fieldLabel.text = array.title
        cell.checkMarkButton.backgroundColor = array.isMarked ? .black : .white
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let cell = tableView.cellForRow(at: indexPath) as? CheckMarkCell else { return }
        
        var array = model[indexPath.row]
        array.isMarked = !array.isMarked
        model.remove(at: indexPath.row)
        model.insert(array, at: indexPath.row)
        
        cell.checkMarkButton.backgroundColor = array.isMarked ? .black : .white
        
    }
}
