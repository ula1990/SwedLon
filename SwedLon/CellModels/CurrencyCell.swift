//
//  CurrencyCell.swift
//  SwedLon
//
//  Created by Uladzislau Daratsiuk on 12/04/2018.
//  Copyright © 2018 Uladzislau Daratsiuk. All rights reserved.
//

import Foundation
import UIKit

class CurrencyCell: UICollectionViewCell {
    
    let flagImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
      //  image.backgroundColor = UIColor.white
        image.layer.cornerRadius = 17.5
        image.contentMode = .scaleAspectFill
        image.layer.shadowOpacity = 0.6
        image.layer.shadowRadius = 8
  //      image.layer.borderWidth = 1
        image.layer.borderColor = UIColor.lightGray.cgColor.copy(alpha: 0.3)
        image.image = UIImage(named: "GBP")
        return image
    }()
    
    
    let stocksTriangleImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "triangle_up")
        image.tintColor = UIColor(named: "greenStock")
        return image
    }()
    
    let rateLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = UIColor.black.withAlphaComponent(0.6)
        label.text = "1.66"
        label.textAlignment = .center
        return label
    }()
    
    let currencyName : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = UIColor.black.withAlphaComponent(0.6)
        label.text = "GBP"
        label.textAlignment = .center
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(flagImage)
        self.addSubview(stocksTriangleImage)
        self.addSubview(currencyName)
        self.addSubview(rateLabel)
        setupViewOfCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViewOfCell(){
        flagImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
        flagImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        flagImage.heightAnchor.constraint(equalToConstant: 35).isActive = true
        flagImage.widthAnchor.constraint(equalToConstant: 35).isActive = true
        
        
        stocksTriangleImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5).isActive = true
        stocksTriangleImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        stocksTriangleImage.heightAnchor.constraint(equalToConstant: 30).isActive = true
        stocksTriangleImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        rateLabel.leftAnchor.constraint(equalTo: currencyName.rightAnchor, constant: 5).isActive = true
        rateLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
        rateLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        rateLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        currencyName.leftAnchor.constraint(equalTo: flagImage.rightAnchor, constant: 5).isActive = true
        currencyName.topAnchor.constraint(equalTo: self.topAnchor, constant: 14).isActive = true
        currencyName.heightAnchor.constraint(equalToConstant: 20).isActive = true
        currencyName.widthAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
