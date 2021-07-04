//
//  EventLogger.swift
//  ExchangeMoney
//
//  Created by User on 02/07/2021.
//

import Foundation
import Alamofire

class EventLogger: EventMonitor {
  let queue = DispatchQueue(label: "com.product.IOS14.Githubgenics.networklogger")

  func requestDidFinish(_ request: Request) {
	print(request.description)
  }

  func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
	guard let data = response.data else {
	  return
	}
	if let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) {
	  print(json)
	}
  }
}
