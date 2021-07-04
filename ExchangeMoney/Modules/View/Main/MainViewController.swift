//
//  ViewController.swift
//  ExchangeMoney
//
//  Created by User on 29/06/2021.
//

import UIKit

class MainViewController: UIViewController {
	
	@IBOutlet weak var imageHeader: UIImageView!
	@IBOutlet weak var tableView: UITableView!
   r
	
	
	var list = [Currency]()
	
   
	
	override func viewDidLoad() {
		super.viewDidLoad()
		let viewModel = CurrencyViewModel(list: list,navigator: .init(self.navigationController))
		
		tableView.registerCellNib(cellClass: CurrencyTableViewCell.self)
		
		viewModel.items.bind { (items) in
			self.list = items
			self.tableView.reloadData()
		  }
		
		viewModel.getList()
	}
		
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		list.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeue() as CurrencyTableViewCell
		cell.CellData(model: list[indexPath.row])
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		
		
		let vc = UIStoryboard.init(name: "Main" , bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailViewController") as? ExchangeViewController
		vc?.hidesBottomBarWhenPushed = true
		navigationController?.pushViewController(vc!, animated: true)
	}
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 90
	}
}
