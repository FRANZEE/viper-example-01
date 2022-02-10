//
//  Protocol.swift
//  Viper Example 01
//
//  Created by Ash on 10.02.2022.
//

import Foundation
import UIKit

// MARK: Управление модулем
protocol CurrencyDetailAssemblyProtocol: AnyObject {
    //Router -> Assembly
    func createCurrencyDetailModule(currency: Currency) -> CurrencyDetailVC
}

// MARK: Управление переходами вида
protocol CurrencyDetailRouterProtocol: AnyObject {
    //Presenter -> Router
    func openCurrencyDetail(from view: UIViewController)
}

// MARK: Управление видом
protocol CurrencyDetailViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    func show(currency: Currency)
    func show(imageData: Data)
}

// MARK: Управление логикой вида
protocol CurrencyDetailPresenterProtocol: AnyObject {
    //View -> Presenter
    var assembly: CurrencyDetailAssemblyProtocol? { get set }
    var router: CurrencyDetailRouterProtocol? { get set }
    var view: CurrencyDetailViewProtocol? { get set }
    var interactor: CurrencyDetailInteractorInputProtocol? { get set }
    var currency: Currency? { get set }
    
    func viewDidLoad()
}

// MARK: Управление бизнес логикой модуля
protocol CurrencyDetailInteractorInputProtocol: AnyObject {
    //Presenter -> Interactor
    func loadImage(urlString: String)
}

protocol CurrencyDetailInteractorOutputProtocol: AnyObject {
    //Interactor -> Presenter
    func imageDataLoaded(data: Data)
}
