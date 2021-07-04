//
//  CurrencyModel.swift
//  ExchangeMoney
//
//  Created by User on 02/07/2021.
//

import Foundation


import Foundation

struct CurrencyModel {
	let responseSuccess: Bool
	let rateCurrentTimeStamp: Int
	let currencyBase: String
	let currencyDate: String
	let currencyRates: [String: Double]
	
	enum CurrencyCodingKeys: String, CodingKey {
		case responseSuccess = "success"
		case rateCurrentTimeStamp = "timestamp"
		case currencyBase = "base"
		case currencyDate = "date"
		case currencyRates = "rates"
	}
}

extension CurrencyModel: Decodable {
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CurrencyCodingKeys.self)
		responseSuccess = try container.decode(Bool.self, forKey: .responseSuccess)
		rateCurrentTimeStamp = try container.decode(Int.self, forKey: .rateCurrentTimeStamp)
		currencyBase = try container.decode(String.self, forKey: .currencyBase)
		currencyDate = try container.decode(String.self, forKey: .currencyDate)
		currencyRates = try container.decode([String: Double].self, forKey: .currencyRates)
	}
}


class Currency {
	 var code: String?
	 var rate: Double?
	
	
	init() {
	}
	
	init(code: String,rate: Double) {
		self.code = code
		self.rate = rate
	}
}
