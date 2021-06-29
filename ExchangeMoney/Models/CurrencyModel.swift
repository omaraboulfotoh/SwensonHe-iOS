//
//  CurrencyModel.swift
//  ExchangeMoney
//
//  Created by User on 29/06/2021.
//

import Foundation

class CurrencyModel {
	 var code: String?
	 var rate: Double?
	
	
	init() {
	}
	init(code: String,rate: Double) {
		self.code = code
		self.rate = rate
	}
}
