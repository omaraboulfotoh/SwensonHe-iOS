//
//  ViewController.swift
//  ExchangeMoney
//
//  Created by User on 29/06/2021.
//

import UIKit
import RxSwift
import RxCocoa

class MainViewController: UIViewController {
	
	@IBOutlet weak var imageHeader: UIImageView!
	@IBOutlet weak var tableView: UITableView!
	var  viewModel : CurrencyViewModel!
	private let bag = DisposeBag()
	
	
	var list = [Currency]()
	
   
	
	override func viewDidLoad() {
		super.viewDidLoad()
		 viewModel = CurrencyViewModel(list: list,navigator: .init(self.navigationController))
		
		tableView.registerCellNib(cellClass: CurrencyTableViewCell.self)
		

		bindTableData()
	}
	
	func bindTableData() {
		// bind items to tableView
		viewModel.items.bind(to: tableView.rx.items(cellIdentifier: "CurrencyTableViewCell", cellType: CurrencyTableViewCell.self)) { row, model, cell in
			cell.CellData(model: model)
		}.disposed(by: bag)
		// bind model selected
		tableView.rx.modelSelected(Currency.self).bind { result in
			self.viewModel.startExchange(currrency: result)
			
		}.disposed(by: bag)
		// fetch items
		viewModel.getList()
	}
		
}

//extension MainViewController:  UITableViewDelegate {
//	
//	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//		return 90
//	}
//	
//}
