//
//  HeaderView.swift
//  PersonalData
//
//  Created by Egor SAUSHKIN on 24.10.2022.
//

import UIKit

class HeaderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints(){
        topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        heightAnchor.constraint(equalToConstant: 220).isActive = true
        leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor).isActive = true
        rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor).isActive = true
    }
}
