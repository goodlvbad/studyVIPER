//
//  View.swift
//  studyVIPER
//
//  Created by Светлана on 14.12.2021.
//

import Foundation
import UIKit

protocol AnyView {
    var presenter: AnyPresenter? { get set }
    
    func update(with heroes: [Heroes])
    func update(with error: String)
}

class HeroViewController: UIViewController, AnyView {
    var presenter: AnyPresenter?
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.isHidden = true
        return table
    }()
    
    var heroes: [Heroes] = []
    
    let errorLabel: UILabel = {
        let label = UILabel()
        label.font.withSize(28)
        label.textColor = .darkText
        label.isHidden = true
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func update(with heroes: [Heroes]) {
        DispatchQueue.main.async {
            self.heroes = heroes
            self.tableView.reloadData()
            self.tableView.isHidden = false
        }
    }
    
    func update(with error: String) {
        print(error)
        
    }
    
    
}


extension HeroViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = heroes[indexPath.row].name
        return cell
    }

}
