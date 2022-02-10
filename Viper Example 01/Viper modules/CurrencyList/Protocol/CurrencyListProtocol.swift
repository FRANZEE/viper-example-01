//
//  Protocol.swift
//  Viper Example 01
//
//  Created by Ash on 10.02.2022.
//

import Foundation
import UIKit

// MARK: Управление модулем
protocol CurrencyListAssemblyProtocol: AnyObject {
    //Router -> Assembly
    func createCurrencyListModule(view: CurrencyListVC)
}

// MARK: Управление видом
protocol CurrencyListViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    func show(data: [Currency])
}

// MARK: Управление логикой вида
protocol CurrencyListPresenterProtocol: AnyObject {
    //View -> Presenter
    var assembly: CurrencyListAssemblyProtocol? { get set }
    var router: CurrencyListRouterProtocol? { get set }
    var view: CurrencyListViewProtocol? { get set }
    var interactor: CurrencyListInteractorInputProtocol? { get set }
    
    func viewDidLoad()
}

// MARK: Управление переходами вида
protocol CurrencyListRouterProtocol: AnyObject {
    //Presenter -> Router
    func openCurrencyDetail(from view: CurrencyListVC, currency: Currency)
}

// MARK: Управление бизнес логикой модуля
protocol CurrencyListInteractorInputProtocol: AnyObject {
    //Presenter -> Interactor
    func loadCurrencyList()
}

protocol CurrencyListInteractorOutputProtocol: AnyObject {
    //Interactor -> Presenter
    func currencyListLoaded(list: [Currency])
}




