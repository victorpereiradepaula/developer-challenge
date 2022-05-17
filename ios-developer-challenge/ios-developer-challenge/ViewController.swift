//
//  ViewController.swift
//  ios-developer-challenge
//
//  Created by Victor Pereira de Paula on 16/05/22.
//

import UIKit

final class ViewController: UIViewController {
    
    var cats: [Any] = [
        Cat(name: "Gato onça", imageName: "jaguar_cat"),
        Cat(name: "Gato caixa", imageName: "box_cat"),
        Cat(name: "Gato pão", imageName: "bread_cat"),
        Cat(name: "Gato pão", imageName: "bread_cat"),
            Dog(name: "Cachorro coelho", imageName: "cachorro_coelho"),
        Cat(name: "Gato caixa", imageName: "box_cat"),
        Cat(name: "Gato caixa", imageName: "box_cat"),
        Cat(name: "Gato onça", imageName: "jaguar_cat"),
        Cat(name: "Gato pão", imageName: "bread_cat"),
        "Gato pão",
        Cat(name: "Gato chapéu", imageName: "hat_cat"),
        Cat(name: "Gato onça", imageName: "jaguar_cat"),
        Cat(name: "Gato rico", imageName: "rich_cat"),
        Cat(name: "Gato sinuca", imageName: "snooker_cat"),
        Cat(name: "Gato dominhoco", imageName: "sleeping_cat"),
        Cat(name: "Gato sinuca", imageName: "snooker_cat"),
        Dog(name:"Cachorro coelho",imageName:""),
    ]

    @IBOutlet weak var tableView: UITableView!
    @IBAction func buttonAction(_ sender: UIButton) {
        removeDuplicatedContent()
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        tableView.dataSource = self
    }
    
    func removeDuplicatedContent() {
        // TODO: Your code here
    }
}

// MARK: UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        if let gato_atual = cats[indexPath.row] as? Cat {
            cell.setup(cat: gato_atual, index: indexPath.row)
        } else if let currentDog = cats[indexPath.row] as? Dog {
            cell.setup(dog: currentDog, index: indexPath.row)
        }
        return cell
    }
}
