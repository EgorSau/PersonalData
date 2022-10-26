//
//  ChildTableViewCell.swift
//  PersonalData
//
//  Created by Egor SAUSHKIN on 24.10.2022.
//

import UIKit

protocol ChildTableDelegate {
//    func deleteRow(withTag: Int, inArray: [Int]) -> Int
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
        self.nameTextField.text = nil
        self.ageTextField.text = nil
//        self.cellArray.remove(at: self.tag)
        self.tag = 0
    }
    
    @objc
    func deleteChild(){
        self.delegateFromTable?.deleteRow(withTag: deleteButton.tag)
//        guard let index = self.delegateFromTable?.deleteRow(withTag: deleteButton.tag, inArray: cellArray) else { return }
//            if index == 5 {
//                return
//            } else {
//                print("NOT COME HERE")
//                self.cellArray.remove(at: index)
//            }
    }
    
    func setupConstraints(){
        
        //MARK: View
        self.contentView.addSubview(cellView)
        cellView.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        cellView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        cellView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor).isActive = true
        cellView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor).isActive = true
        
        //MARK: NameTextField
        self.cellView.addSubview(nameTextField)
        nameTextField.topAnchor.constraint(equalTo: self.cellView.topAnchor, constant: 10).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nameTextField.leftAnchor.constraint(equalTo: self.cellView.leftAnchor, constant: 16).isActive = true
        nameTextField.rightAnchor.constraint(equalTo: self.cellView.centerXAnchor).isActive = true
        
        //MARK: AgeTextField
        self.cellView.addSubview(ageTextField)
        ageTextField.topAnchor.constraint(equalTo: self.nameTextField.bottomAnchor, constant: 10).isActive = true
        ageTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        ageTextField.leftAnchor.constraint(equalTo: self.cellView.leftAnchor, constant: 16).isActive = true
        ageTextField.rightAnchor.constraint(equalTo: self.cellView.centerXAnchor).isActive = true
        
        //MARK: Button
        self.cellView.addSubview(deleteButton)
        deleteButton.topAnchor.constraint(equalTo: self.cellView.topAnchor, constant: 10).isActive = true
        deleteButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        deleteButton.leftAnchor.constraint(equalTo: self.cellView.rightAnchor, constant: -300).isActive = true
        deleteButton.rightAnchor.constraint(equalTo: self.cellView.rightAnchor, constant: -16).isActive = true
    }
}

