//
//  ExchangeViewController.swift
//  ExchangeMoney
//
//  Created by User on 29/06/2021.
//

import UIKit

class ExchangeViewController: UIViewController {
	
	@IBOutlet weak var errorView: UIView!
	@IBOutlet weak var errorLabel: UILabel!
	@IBOutlet weak var currencyTF: UITextField!
	@IBOutlet weak var resultLabel: UILabel!
	override func viewDidLoad() {
		super.viewDidLoad()
		errorView.alpha = 0
		errorLabel.isHidden = true
		currencyTF.delegate = self
	}
	
}
extension ExchangeViewController: UITextFieldDelegate {
	func textFieldDidBeginEditing(_ textField: UITextField) {
	}
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
		errorView.alpha = 1
		errorLabel.isHidden = false
		return true
	}
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		DispatchQueue.main.async {
			self.resultLabel.text = "\(self.currencyTF.text!)  USD"
		}
		return true
	}
}
