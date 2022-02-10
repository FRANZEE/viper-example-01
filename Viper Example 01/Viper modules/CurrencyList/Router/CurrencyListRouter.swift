//
//  CurrencyListRouter.swift
//  Viper Example 01
//
//  Created by Ash on 10.02.2022.
//

import Foundation
import UIKit

class CurrencyListRouter: CurrencyListRouterProtocol {
    
    func openCurrencyDetail(from view: CurrencyListVC, currency: Currency) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: CurrencyDetailVC.self)) as! CurrencyDetailVC
        CurrencyDetailAssembly.createModule(view: viewController, currency: currency)
        view.navigationController?.pushViewController(viewController, animated: true)
        
    }
    
}
