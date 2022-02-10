//
//  CurrencyDetailVC.swift
//  Viper Example 01
//
//  Created by Ash on 10.02.2022.
//

import UIKit
import SnapKit
import SwiftSVG

class CurrencyDetailVC: UIViewController {
    
    var presenter: CurrencyDetailPresenterProtocol?
    
    // views
    private var imageView: UIView = {
        let view = UIView()
        return view
    }()
    
    private var nameLabel: UILabel = {
        let view = UILabel()
        return view
    }()
    
    private var priceLabel: UILabel = {
        let view = UILabel()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(imageView)
        view.addSubview(nameLabel)
        view.addSubview(priceLabel)
        
        presenter?.viewDidLoad()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        imageView.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 200, height: 200))
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(150)
//            make.center.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 200, height: 50))
            make.centerX.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(50)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 200, height: 50))
            make.centerX.equalToSuperview()
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
        }
    }
    
}

extension CurrencyDetailVC: CurrencyDetailViewProtocol {
    
    func show(imageData: Data) {
        let view = UIView(SVGData: imageData) { (svgLayer) in svgLayer.boundingBox = CGRect(x: 0, y: 0, width: 200, height: 200)
        }
        view.frame.size = CGSize(width: 200, height: 200)
        imageView.addSubview(view)
    }
    
    func show(currency: Currency) {
        nameLabel.text = currency.name
        priceLabel.text = currency.price
    }
    
    
}
