//
//  CurrencyListVC.swift
//  Viper Example 01
//
//  Created by Ash on 10.02.2022.
//

import UIKit

class CurrencyListVC: UIViewController {
    
    private var tableList: [Currency] = [Currency(id: "Test", name: "Test", price: "Test", logo_url: "test")]
    var presenter: CurrencyListPresenterProtocol?
    
    private let tableView: UITableView = {
        let view = UITableView()
        view.register(UITableViewCell.self, forCellReuseIdentifier: "CurrencyListTableCellId")
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        
        CurrencyListAssembly().createCurrencyListModule(view: self)
        presenter?.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
    }

}

extension CurrencyListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyListTableCellId", for: indexPath)
        cell.textLabel?.text = tableList[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.router?.openCurrencyDetail(from: self, currency: tableList[indexPath.row])
    }
}

extension CurrencyListVC: UITableViewDelegate {
    
}

extension CurrencyListVC: CurrencyListViewProtocol {
    func show(data: [Currency]) {
        tableList = data
        tableView.reloadData()
    }
    
    
}
