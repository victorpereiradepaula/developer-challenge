//
//  TableViewCell.swift
//  ios-developer-challenge
//
//  Created by Victor Pereira de Paula on 16/05/22.
//

import UIKit

final class TableViewCell: UITableViewCell {

    @IBOutlet weak var indexLabel: UILabel!
    @IBOutlet weak var sampleImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    public func setup(cat: Cat, index: Int) {
        sampleImage.image = cat.image
        titleLabel.text = cat.name
        indexLabel.text = "\(index)"
    }
    
    public func setup(dog: Dog, index: Int) {
        sampleImage.image = dog.image
        titleLabel.text = dog.name
        indexLabel.text = "\(index)"
    }
}
