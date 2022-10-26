//
//  ChildTableViewCell.swift
//  PersonalData
//
//  Created by Egor SAUSHKIN on 24.10.2022.
//

import UIKit

protocol ChildTableDelegate {
    func deleteRow(withTag: Int)
}

class ChildTableViewCell: UITableViewCell {
    
    var delegateFromTable: ChildTableDelegate?
    var cellArray: [Int] = []
    
    private let cellView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 2
        textField.layer.borderColor = Colors.colorTextField.cgColor
        textField.attributedPlaceholder = NSAttributedString(string: Names.name,
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.leftViewMode = .always
        textField.keyboardType = .default
        textField.returnKeyType = .default
        textField.clearButtonMode = .whileEditing
        return textField
    }()
    
    private let ageTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 2
        textField.layer.borderColor = Colors.colorTextField.cgColor
        textField.attributedPlaceholder = NSAttributedString(string: Names.age,
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.leftViewMode = .always
        textField.keyboardType = .default
        textField.returnKeyType = .default
        textField.clearButtonMode = .whileEditing
        return textField
    }()
    
    let deleteButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(deleteChild), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Names.delete, for: .normal)
        button.setTitleColor(Colors.colorBlueButton, for: .normal)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameTextField.text = nil
        ageTextField.text = nil
        tag = 0
    }
    
    @objc
    func deleteChild(){
        delegateFromTable?.deleteRow(withTag: deleteButton.tag)
    }
    
    private func setupConstraints(){
        
        //MARK: View
        contentView.addSubview(cellView)
        cellView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        cellView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        cellView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        
        //MARK: NameTextField
        cellView.addSubview(nameTextField)
        nameTextField.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 10).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nameTextField.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 16).isActive = true
        nameTextField.rightAnchor.constraint(equalTo: cellView.centerXAnchor).isActive = true
        
        //MARK: AgeTextField
        cellView.addSubview(ageTextField)
        ageTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10).isActive = true
        ageTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        ageTextField.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 16).isActive = true
        ageTextField.rightAnchor.constraint(equalTo: cellView.centerXAnchor).isActive = true
        
        //MARK: Button
        cellView.addSubview(deleteButton)
        deleteButton.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 10).isActive = true
        deleteButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        deleteButton.leftAnchor.constraint(equalTo: cellView.rightAnchor, constant: -300).isActive = true
        deleteButton.rightAnchor.constraint(equalTo: cellView.rightAnchor, constant: -16).isActive = true
    }
}

