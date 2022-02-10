//
//  CurrencyDetail.swift
//  Viper Example 01
//
//  Created by Ash on 10.02.2022.
//

import Foundation
import UIKit

class CurrencyDetailAssembly {
    
    class func createModule(view: CurrencyDetailVC, currency: Currency) {
        
        let presenter: CurrencyDetailPresenterProtocol & CurrencyDetailInteractorOutputProtocol = CurrencyDetailPresenter()
        
        let interactor = CurrencyDetailInteractor()
        interactor.presenter = presenter
        
        view.presenter = presenter
        view.presenter?.view = view
        view.presenter?.router = CurrencyDetailRouter()
        view.presenter?.interactor = interactor
        view.presenter?.currency = currency
    }
    
}
