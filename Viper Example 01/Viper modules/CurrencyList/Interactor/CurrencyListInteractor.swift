//
//  CurrencyListInteractor.swift
//  Viper Example 01
//
//  Created by Ash on 10.02.2022.
//

import Foundation

class CurrencyListInteractor: CurrencyListInteractorInputProtocol {
    
    public weak var presenter: CurrencyListInteractorOutputProtocol?
    
    func loadCurrencyList() {
        NetworkService().fetchData(callback: { [weak self] (data) in
            DispatchQueue.main.async {
                self?.presenter?.currencyListLoaded(list: data)
            }
            print(data)
        })
    }
}
