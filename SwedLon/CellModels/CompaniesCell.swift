//
//  CompaniesCell.swift
//  SwedLon
//
//  Created by Uladzislau Daratsiuk on 11/04/2018.
//  Copyright © 2018 Uladzislau Daratsiuk. All rights reserved.
//

import UIKit

class CompaniesCell: UICollectionViewCell {
    
    let companyButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.backgroundColor = .black
        button.layer.cornerRadius = 25
        return button
    }()
    
    func updateButtonBackground(company: Company){
        companyButton.setBackgroundImage(UIImage(named: (company.logoName)!), for: .normal)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(companyButton)
        setupViewOfCell()
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupViewOfCell(){

        companyButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        companyButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        companyButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        companyButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        
    }
    
}
