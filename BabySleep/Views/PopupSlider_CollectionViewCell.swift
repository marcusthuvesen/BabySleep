//
//  PopupSlider_CollectionViewCell.swift
//  Tinnitus
//
//  Created by Marcus Thuvesen on 2019-08-22.
//  Copyright © 2019 Marcus Thuvesen. All rights reserved.
//

import UIKit

class PopupSlider_CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var sliderCellImage: UIImageView!
    @IBOutlet weak var sliderCellTitleLabel: UILabel!
    @IBOutlet weak var sliderCellSubLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        sliderCellImage.contentMode = .scaleAspectFit
    }
    
}
