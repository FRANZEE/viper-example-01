//
//  CurrencyDetailInteractor.swift
//  Viper Example 01
//
//  Created by Ash on 10.02.2022.
//

import Foundation

class CurrencyDetailInteractor: CurrencyDetailInteractorInputProtocol {
    
    weak var presenter: CurrencyDetailInteractorOutputProtocol?
    
    func loadImage(urlString: String) {
        NetworkService().loadImage(urlString: urlString, callback: { [weak self] (data) in
            DispatchQueue.main.async {
                print(urlString)
                self?.presenter?.imageDataLoaded(data: data)
            }
        })
    }
    
}
