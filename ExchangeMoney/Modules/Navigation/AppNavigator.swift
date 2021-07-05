//
//  AppNavigator.swift
//  ExchangeMoney
//
//  Created by User on 04/07/2021.
//

import Foundation
import UIKit


class AppNavigator {
	
	private let navigationController: UINavigationController?
	
	init(_ navigationController: UINavigationController?) {
		self.navigationController = navigationController
	}
	
	// MARK: - Internal Method
	
	func startExchange(model: Currency) {
		
		let vc = UIStoryboard.init(name: "Main" , bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailViewController") as? ExchangeViewController
		
		vc!.model = model
		navigationController?.show(vc!, sender: nil)
	}
	
}

