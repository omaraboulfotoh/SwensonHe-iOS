//
//  APIService.swift
//  ExchangeMoney
//
//  Created by User on 29/06/2021.
//



import Foundation
import Alamofire
import CryptoSwift
import RxCocoa
import SwiftyJSON

class MarvelService {
	
//	@discardableResult
//	public func getCharacters(name: String, offset: Int, completion: @escaping (NSError?, [CurrencyModel]?) -> Void) -> URLSessionTask? {
//
//		let url = "\(BASE_URL)latest"
//		var param = [String: Any]()
//		let timeStamp = Int(Date().timeIntervalSince1970)
//		param["access_key"] = API_KEY
//		param["base"] = DEFAULT_CURRENCY
//
//		let headers = ["Content-Type":"application/json", "Accept":"application/json"]
//
//		return Alamofire.request(url, method: HTTPMethod.get, parameters: param, encoding: URLEncoding.default, headers: headers).responseJSON { (response) in
//
//			switch response.result {
//			case .success(let value):
//				let json = JSON(value)
//				let error = json["error"]
//				guard error.isEmpty else {return}
//				guard let data = json["data"].dictionary else {return}
//				guard let result = data["results"]?.array else {return}
//
//				completion(nil, result.compactMap({MarvelHeroModel(json: $0)}))
//			case .failure(let error):
//				completion(error as NSError, nil)
//			}
//			}.task
//	}
}

