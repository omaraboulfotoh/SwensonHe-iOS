//
//  CurrencyViewModel.swift
//  ExchangeMoney
//
//  Created by User on 02/07/2021.
//

import Foundation


protocol CurrencyViewModelProtocol {
	
	var items: Observable<[Currency]> { get  set }
	
	func getList()
}

class CurrencyViewModel: CurrencyViewModelProtocol {
	
	var items: Observable<[Currency]>
	private let navigator: AppNavigator
	
	init(list : [Currency],navigator: AppNavigator) {
		items = Observable(list)
		self.navigator = navigator
	}
	
	func getList()  {
		var list = [Currency]()
		APIService.performRequest(dataModel: CurrencyModel.self, requestData: RequestRouter.currencyConvertor) { [weak self] (result) in
			result.currencyRates.map { key, value in
				list.append(Currency(code: key,rate: value))
			}
			
			self?.items = Observable(list)
		}
		
		
	}
	func startExchange(currrency :Currency)  {
		navigator.startExchange(model: currrency)
	}
	
}
