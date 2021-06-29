//
//  CurrencyModel.swift
//  ExchangeMoney
//
//  Created by User on 29/06/2021.
//

import Foundation

class CurrencyModel {
	 var code: String?
	var countryCode :String?
	 var rate: Double?
	
	
	init() {
	}
	
	init(code: String,rate: Double,countryCode:String) {
		self.code = code
		self.countryCode = countryCode
		self.rate = rate
	}
}
