//
//  CurrencyListAssembly.swift
//  Viper Example 01
//
//  Created by Ash on 10.02.2022.
//

import Foundation

class CurrencyListAssembly: CurrencyListAssemblyProtocol {
    
    func createCurrencyListModule(view: CurrencyListVC) {
        
        // : CurrencyListPresenterProtocol & CurrencyListInteractorOutputProtocol
        let presenter = CurrencyListPresenter()
        
        let interactor = CurrencyListInteractor()
        interactor.presenter = presenter
        
        view.presenter = presenter
        view.presenter?.view = view
        view.presenter?.router = CurrencyListRouter()
        view.presenter?.interactor = interactor
    }
    
    
}
