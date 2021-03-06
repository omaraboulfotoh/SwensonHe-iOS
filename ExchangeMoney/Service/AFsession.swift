//
//  AFsession.swift
//  ExchangeMoney
//
//  Created by User on 02/07/2021.
//

import Alamofire

let AFsession: Session = {
  let configuration = URLSessionConfiguration.af.default
  configuration.requestCachePolicy = .returnCacheDataElseLoad
  let responseCacher = ResponseCacher(behavior: .modify { _, response in
	let userInfo = ["date": Date()]
	return CachedURLResponse(
	  response: response.response,
	  data: response.data,
	  userInfo: userInfo,
	  storagePolicy: .allowed)
  })

  let networkLogger = EventLogger()
  let interceptor = Interceptor()

  return Session(
	configuration: configuration,
	interceptor: interceptor,
	cachedResponseHandler: responseCacher,
	eventMonitors: [networkLogger])
}()
