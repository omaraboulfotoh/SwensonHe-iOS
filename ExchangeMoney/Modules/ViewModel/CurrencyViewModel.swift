//
//  CurrencyViewModel.swift
//  ExchangeMoney
//
//  Created by User on 02/07/2021.
//

import Foundation
import RxSwift
import RxCocoa

protocol CurrencyViewModelProtocol {
	
	var items: PublishSubject<[Currency]> { get  set }
	
	func getList()
}

class CurrencyViewModel: CurrencyViewModelProtocol {
	
	var items = PublishSubject<[Currency]>()
	private let navigator: AppNavigator
	
	init(list : [Currency],navigator: AppNavigator) {
		
		self.navigator = navigator
	}
	
	func getList()  {
		var list = [Currency]()
		APIService.performRequest(dataModel: CurrencyModel.self, requestData: RequestRouter.currencyConvertor) { [weak self] (result) in
			result.currencyRates.map { key, value in
				list.append(Currency(code: key,rate: value))
			}
			
			self?.items.onNext(list)
			self?.items.onCompleted()
			
		}
		
		
	}
	func startExchange(currrency :Currency)  {
		navigator.startExchange(model: currrency)
	}
	
}
