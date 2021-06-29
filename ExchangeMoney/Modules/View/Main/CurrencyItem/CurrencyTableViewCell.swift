//
//  CurrencyTableViewCell.swift
//  ExchangeMoney
//
//  Created by User on 29/06/2021.
//

import UIKit

class CurrencyTableViewCell:UITableViewCell {
	
	@IBOutlet weak var currencyLabel: UILabel!
	@IBOutlet weak var currencyName: UILabel!
   
	
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		
		// Configure the view for the selected state
	}
	func CellData(model:CurrencyModel) {
		currencyLabel?.text = "\(model.rate ?? 0.0)"
		currencyName?.text = "\(countryFlag(countryCode: model.countryCode!)) \(model.code ?? "USD")"
	}
	
	func countryFlag(countryCode: String) -> String {
	  return String(String.UnicodeScalarView(
		 countryCode.unicodeScalars.compactMap(
		   { UnicodeScalar(127397 + $0.value) })))
	}
}
