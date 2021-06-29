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
	@IBOutlet weak var currencyImage: UIImageView!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		
		// Configure the view for the selected state
	}
	func CellData() {
		currencyLabel?.text = "10"
		currencyName?.text = "USD"
		currencyImage.image = UIImage(named: "currency-1")
	}
}
