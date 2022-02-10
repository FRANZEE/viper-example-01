//
//  CurrencyListPresenter.swift
//  Viper Example 01
//
//  Created by Ash on 10.02.2022.
//

import Foundation

class CurrencyListPresenter: CurrencyListPresenterProtocol {
    
    var interactor: CurrencyListInteractorInputProtocol?
    weak var view: CurrencyListViewProtocol?
    var router: CurrencyListRouterProtocol?
    var assembly: CurrencyListAssemblyProtocol?
    
    func viewDidLoad() {
        interactor?.loadCurrencyList()
    }
    
    
}

extension CurrencyListPresenter: CurrencyListInteractorOutputProtocol {
    func currencyListLoaded(list: [Currency]) {
        view?.show(data: list)
    }
}
