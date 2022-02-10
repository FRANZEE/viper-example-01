//
//  CurrencyDetailPresenter.swift
//  Viper Example 01
//
//  Created by Ash on 10.02.2022.
//

import Foundation

class CurrencyDetailPresenter: CurrencyDetailPresenterProtocol {
    
    var currency: Currency?
    var assembly: CurrencyDetailAssemblyProtocol?
    var router: CurrencyDetailRouterProtocol?
    weak var view: CurrencyDetailViewProtocol?
    var interactor: CurrencyDetailInteractorInputProtocol?
    
    func viewDidLoad() {
        
        guard let currency = currency else {
            print("Error! currency is nil!")
            return
        }
        loadCurrencyData()
        interactor?.loadImage(urlString: currency.logo_url)
        
    }
    
    func loadCurrencyData() {
        if let currency = self.currency {
            view?.show(currency: currency)
        } else {
            print("currency is nil")
        }
        
    }
}

extension CurrencyDetailPresenter: CurrencyDetailInteractorOutputProtocol {
    
    func imageDataLoaded(data: Data) {
        view?.show(imageData: data)
    }
    
    
}
