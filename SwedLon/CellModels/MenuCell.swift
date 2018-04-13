//
//  MenuCell.swift
//  SwedLon
//
//  Created by Uladzislau Daratsiuk on 13/04/2018.
//  Copyright © 2018 Uladzislau Daratsiuk. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {
    
    
    let titleName : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.black.withAlphaComponent(0.8)
        label.textAlignment = .center
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(titleName)
        setupMenuTitle()
        
    }
    
    func setupMenuTitle(){
        
        titleName.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleName.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        titleName.widthAnchor.constraint(equalToConstant: 150).isActive = true
        titleName.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
