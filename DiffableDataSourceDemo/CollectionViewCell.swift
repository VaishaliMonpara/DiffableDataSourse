//
//  CollectionViewCell.swift
//  DiffableDataSourceDemo
//
//  Created by MAC0008 on 13/02/20.
//  Copyright © 2020 MAC0008. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var widthConstraints: NSLayoutConstraint!
    
    override func awakeFromNib() {
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
    }
}
