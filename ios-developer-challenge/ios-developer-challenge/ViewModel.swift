//
//  ViewModel.swift
//  ios-developer-challenge
//
//  Created by Gabriel Monteiro Camargo da Silva on 04/07/22.
//

import Foundation

protocol ViewModelDelegate {
    func viewModelDidLoadTitle(title: String)
}

class ViewModel {
    var delegate: ViewModelDelegate?
    
    init(delegate: ViewModelDelegate? = nil) {
        self.delegate = delegate
    }
     
    func loadTitle() {
        DispatchQueue.global(qos: .background).async { // requesting title
            self.delegate?.viewModelDidLoadTitle(title: "App Animais")
        }
    }
}
