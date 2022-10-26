//
//  ViewController.swift
//  PersonalData
//
//  Created by Egor SAUSHKIN on 24.10.2022.
//

import UIKit

protocol AlertDelegate {
    func showAlert(completion: @escaping ()->())
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let childView = ChildTableView()
        childView.alertDelegate = self
        view = childView
    }
}

extension ViewController: AlertDelegate {
    func showAlert(completion: @escaping ()->()){
        let alert = UIAlertController(title: Names.confirmation, message: nil, preferredStyle: .alert)
        let action1 = UIAlertAction(title: Names.cancel, style: .default)
        let action2 = UIAlertAction(title: Names.withDraw, style: .cancel) { _ in
            completion()
        }
        alert.addAction(action1)
        alert.addAction(action2)
        present(alert, animated: true)
    }
}
