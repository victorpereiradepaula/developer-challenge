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
        Dog(name: "Cachorro coelho",imageName: ""),
    ]
    
    var viewModel = ViewModel()

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        viewModel.loadTitle()
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        handleList()
        tableView.reloadData()
    }
    
    func handleList() {
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

// MARK: UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var alertTitle = ""
        var alertMessage: String = ""
        if let gato_atual = cats[indexPath.row] as? Cat {
            alertTitle = "Gatos falam"
            alertMessage = gato_atual.phrase
        } else if let currentDog = cats[indexPath.row] as? Dog {
            alertTitle = "Cachorros falam"
            alertMessage = currentDog.phrase
        }
        let alertController = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Fechar", style: .default)
        alertController.addAction(alertAction)
        
        present(alertController, animated: true)
    }
}

// MARK: ViewModelDelegate
extension ViewController: ViewModelDelegate {
    func viewModelDidLoadTitle(title: String) {
        titleLabel.text = title
    }
}
