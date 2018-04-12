//
//  CompCollectionExtension.swift
//  SwedLon
//
//  Created by Uladzislau Daratsiuk on 11/04/2018.
//  Copyright © 2018 Uladzislau Daratsiuk. All rights reserved.
//

import Foundation
import UIKit

extension MainVC: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == companiesCollectionView {
            return companyList.count
        }else{
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == companiesCollectionView {
            let company = companyList[indexPath.row]
            let cell = companiesCollectionView.dequeueReusableCell(withReuseIdentifier: companyCollectionCellId, for: indexPath) as! CompanyCell
            cell.updateButtonBackground(company: company)
            cell.layer.borderWidth = 0
            return cell
        }else {
            let cell = currenciesCollectionView.dequeueReusableCell(withReuseIdentifier: currencyCollectionCellId, for: indexPath) as! CurrencyCell
            cell.layer.borderWidth = 1
            cell.layer.borderColor = UIColor.lightGray.cgColor.copy(alpha: 0.2)
            cell.layer.cornerRadius = 5
            cell.layer.shadowOpacity = 0.2
            cell.layer.shadowRadius = 2
            cell.backgroundColor = .white
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == companiesCollectionView {
        return CGSize(width: 50, height: 50)
        }else{
            return CGSize(width: 120, height: 70)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
         if collectionView == companiesCollectionView {
        return UIEdgeInsets(top: 5, left: 2, bottom: 5, right: 2)
         }else{
        return UIEdgeInsets(top: 3, left: 4, bottom: 3, right: 4)
        }
    }
}

