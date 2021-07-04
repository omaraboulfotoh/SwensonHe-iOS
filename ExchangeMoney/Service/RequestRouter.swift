//
//  RequestRouter.swift
//  ExchangeMoney
//
//  Created by User on 02/07/2021.
//

import Alamofire

enum RequestRouter {
	
	case currencyConvertor

	var baseURL: String {
		switch self {
		case .currencyConvertor:
			return BASE_URL
		}
	}
	
	var path: String {
		switch self {
		case .currencyConvertor:
			return "latest"
		}
	}
	
	var method: HTTPMethod {
		switch self {
		case .currencyConvertor:
			return .get
		}
	}
	
	var parameters: [String: String]? {
		switch self {
		case .currencyConvertor:
			return [
				"access_key": API_KEY,
				"base" : DEFAULT_CURRENCY
			]
		}
	}
}

// MARK: - URLRequestConvertible

extension RequestRouter: URLRequestConvertible {
	func asURLRequest() throws -> URLRequest {
		let requestURL = try baseURL.asURL().appendingPathComponent(path)
		var request = URLRequest(url: requestURL)
		request.method = method
		if method == .get {
			request = try URLEncodedFormParameterEncoder().encode(parameters, into: request)
		}
		return request
	}
}

