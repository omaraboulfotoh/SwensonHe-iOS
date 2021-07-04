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

class APIService {
	
	static func performRequest<T: Decodable>(dataModel: T.Type, requestData: RequestRouter, completion: @escaping (T) -> Void) {
		DispatchQueue.global(qos: .background).async {
			AFsession.request(requestData).responseDecodable(of: T.self) { response in
				guard let results = response.value else {
					print("error")
					return
				}
				completion(results)
			}
		}
	}
}

