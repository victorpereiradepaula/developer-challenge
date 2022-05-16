//
//  Cat.swift
//  ios-developer-challenge
//
//  Created by Victor Pereira de Paula on 16/05/22.
//

import UIKit

struct Cat {
    let name: String
    private let imageName: String
    
    public init(name: String, imageName: String) {
        self.name = name
        self.imageName = imageName
    }
    
    var image: UIImage? {
        UIImage(named: imageName)
    }
}
