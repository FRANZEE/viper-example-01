//
//  Router.swift
//  Viper Example 01
//
//  Created by Ash on 10.02.2022.
//

import Foundation
import UIKit

class CurrencyDetailRouter: CurrencyDetailRouterProtocol {
    
    func openCurrencyDetail(from view: UIViewController) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: CurrencyDetailVC.self))
        view.navigationController?.pushViewController(viewController, animated: true)
    }
    
    
}
