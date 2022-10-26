//
//  ChildTableView.swift
//  PersonalData
//
//  Created by Egor SAUSHKIN on 24.10.2022.
//

import UIKit

class ChildTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    var cellCounter: [Int] = []
    var tableArray: [Int] = []
    var alertDelegate: AlertDelegate?
    
    private let headerView: UIView = {
        let view = HeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let footerView: UIView = {
        let view = FooterView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let addButton: UIButton = {
        let button = UIButton()
        button.isHidden = false
        button.layer.cornerRadius = 25
        button.layer.borderColor = Colors.colorBlueButton.cgColor
        button.layer.borderWidth = 2
        button.setTitle(Names.addChild, for: .normal)
        button.setTitleColor(Colors.colorBlueButton, for: .normal)
        button.addTarget(self, action: #selector(addChild), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: Names.plus), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    private let clearButton: UIButton = {
        let button = UIButton()
        button.isHidden = false
        button.layer.cornerRadius = 25
        button.layer.borderColor = Colors.colorRedButton.cgColor
        button.layer.borderWidth = 2
        button.setTitle(Names.clear, for: .normal)
        button.setTitleColor(Colors.colorRedButton, for: .normal)
        button.addTarget(self, action: #selector(clearAll), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let topLabel: UILabel = {
        let label = UILabel()
        label.text = Names.personalData
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let bottomLabel: UILabel = {
        let label = UILabel()
        label.text = Names.children
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        textField.textAlignment = .natural
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
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: .plain)
        setupSelf()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSelf(){
        self.delegate = self
        self.dataSource = self
        self.rowHeight = 130
        self.estimatedRowHeight = 44
        self.register(ChildTableViewCell.self, forCellReuseIdentifier: Names.childCell)
        self.register(ChildTableViewCell.self, forCellReuseIdentifier: Names.defaultCell)
    }
    
    private func setupConstraints(){
        //MARK: HeaderView
        self.addSubview(headerView)
        headerView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true

        //MARK: TopLabel
        self.headerView.addSubview(topLabel)
        topLabel.topAnchor.constraint(equalTo: self.headerView.topAnchor).isActive = true
        topLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        topLabel.leftAnchor.constraint(equalTo: self.headerView.leftAnchor, constant: 16).isActive = true
        topLabel.rightAnchor.constraint(equalTo: self.headerView.rightAnchor, constant: -16).isActive = true

        //MARK: NameTextField
        self.headerView.addSubview(nameTextField)
        nameTextField.topAnchor.constraint(equalTo: self.topLabel.bottomAnchor, constant: 10).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nameTextField.leftAnchor.constraint(equalTo: self.headerView.leftAnchor, constant: 16).isActive = true
        nameTextField.rightAnchor.constraint(equalTo: self.headerView.rightAnchor, constant: -16).isActive = true
        
        //MARK: AgeTextField
        self.headerView.addSubview(ageTextField)
        ageTextField.topAnchor.constraint(equalTo: self.nameTextField.bottomAnchor, constant: 10).isActive = true
        ageTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        ageTextField.leftAnchor.constraint(equalTo: self.headerView.leftAnchor, constant: 16).isActive = true
        ageTextField.rightAnchor.constraint(equalTo: self.headerView.rightAnchor, constant: -16).isActive = true

        //MARK: AddButtons
        self.headerView.addSubview(addButton)
        addButton.topAnchor.constraint(equalTo: self.ageTextField.bottomAnchor, constant: 10).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        addButton.leftAnchor.constraint(equalTo: self.headerView.rightAnchor, constant: -250).isActive = true
        addButton.rightAnchor.constraint(equalTo: self.headerView.rightAnchor, constant: -16).isActive = true
        
        //MARK: BottomLabel
        self.headerView.addSubview(bottomLabel)
        bottomLabel.topAnchor.constraint(equalTo: self.ageTextField.bottomAnchor, constant: 10).isActive = true
        bottomLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        bottomLabel.leftAnchor.constraint(equalTo: self.headerView.leftAnchor, constant: 16).isActive = true

        //MARK: FooterView
        self.addSubview(footerView)
        footerView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor).isActive = true
        footerView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor).isActive = true
        footerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        footerView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        
        //MARK: ClearButtons
        self.footerView.addSubview(clearButton)
        clearButton.topAnchor.constraint(equalTo: self.footerView.topAnchor).isActive = true
        clearButton.bottomAnchor.constraint(equalTo: self.footerView.bottomAnchor).isActive = true
        clearButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        clearButton.centerXAnchor.constraint(equalTo: footerView.centerXAnchor).isActive = true
    }
    
    @objc
    func addChild(){
        DispatchQueue.main.async {
            self.cellCounter.append(0)
            let indexPath = IndexPath(row: self.cellCounter.count - 1, section: 0)
            self.beginUpdates()
            self.insertRows(at: [indexPath], with: .fade)
            self.endUpdates()
        }
    }
    
    @objc
    func clearAll(){
        alertDelegate?.showAlert(completion: {
            
            //MARK: Clean all textFields
            self.nameTextField.text = nil
            self.ageTextField.text = nil
            self.addButton.isHidden = false
            
            //MARK: Remove all cells
            repeat {
                self.beginUpdates()
                self.cellCounter.remove(at: 0)
                self.deleteRows(at: [IndexPath(row: 0, section: 0)], with: .fade)
                self.endUpdates()
            } while self.cellCounter.count > 0
        })
    }

    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headerView
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if cellCounter.count == 5 {
            addButton.isHidden = true
        } else {
            addButton.isHidden = false
        }
        return cellCounter.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Names.childCell, for: indexPath) as? ChildTableViewCell else {
            let cell = tableView.dequeueReusableCell(withIdentifier: Names.defaultCell, for: indexPath)
            return cell
        }
        cell.delegateFromTable = self
        cell.deleteButton.tag = indexPath.row
        tableArray.append(indexPath.row)
        return cell
    }
}

extension ChildTableView: ChildTableDelegate {
//    func deleteRow(withTag: Int, inArray: [Int]) -> Int {
    func deleteRow(withTag: Int){
//        var tempIndex: Int = 5
        tableArray.enumerated().forEach { index, tag in
            if tag == withTag {
                DispatchQueue.main.async {
                    self.cellCounter.removeFirst()
                    if self.tableArray.isEmpty == false {
                        self.tableArray.remove(at: index)
                    }
                    self.beginUpdates()
                    self.deleteRows(at: [IndexPath(row: index, section: 0)], with: .fade)
//                    print("DELETED: \(IndexPath(row: index, section: 0))")
                    self.endUpdates()
//                    tempIndex = index
                }
            }
        }
//        return tempIndex
    }
}