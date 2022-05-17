//
//  Dog.swift
//  ios-developer-challenge
//
//  Created by Victor Pereira de Paula on 17/05/22.
//

import Foundation
import UIKit

import UIKit

struct Dog {
    let name: String
    let imageName: String
    
    public init(name: String, imageName: String) {
        self.name = name
        self.imageName = imageName
    }
    
    var image: UIImage {
        UIImage(named: imageName)!
    }
}
