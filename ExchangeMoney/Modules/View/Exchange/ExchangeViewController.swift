//
//  ExchangeViewController.swift
//  ExchangeMoney
//
//  Created by User on 29/06/2021.
//

import UIKit

class ExchangeViewController: UIViewController {
	
	
	@IBOutlet weak var currencyTF: UITextField!
	@IBOutlet weak var resultLabel: UILabel!
	
	var model = Currency()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		currencyTF.delegate = self
		self.resultLabel.text = "\( self.model.rate!)    \(self.model.code ?? "") "
	}
	
	
	
}
extension ExchangeViewController: UITextFieldDelegate {
	func textFieldDidBeginEditing(_ textField: UITextField) {
		
	}
	
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
		
		return true
	}
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		DispatchQueue.main.async {
			if (!self.currencyTF.text!.isEmpty){
				let number  = Double(self.currencyTF.text!)
				
				self.resultLabel.text = "\(number! * self.model.rate!)   \(self.model.code ?? "") "
			}else{
				self.resultLabel.text =  "  \(self.model.code ?? "") "
			}
		}
		return true
	}
}
