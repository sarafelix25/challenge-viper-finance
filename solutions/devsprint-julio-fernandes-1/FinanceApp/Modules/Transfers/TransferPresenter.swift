//
//  TransfersPresenter.swift
//  FinanceApp
//
//  Created by Alexandre Cardoso on 03/02/22.
//

import Foundation

protocol TransfersPresenterDelegate: AnyObject {

	 func showData()
}

final class TransfersPresenter: TransfersPresenterProtocol {
	weak var view: TransfersPresenterDelegate?
	private var interactor: TransfersInteractorProtocol
	private var router: TransfersRouterProtocol
	
	init(
		interactor: TransfersInteractorProtocol,
		router: TransfersRouterProtocol
	) {
		self.interactor = interactor
		self.router = router
	}
	
	func viewDidLoad() {
		interactor.fetchData()
	}
	
	func navigateToContactList() {
		router.navigateToContactList()
	}
	
	func navigateToConfirmation() {
		router.navigateToConfirmation()
	}
		
}

extension TransfersPresenter: TransfersInteractorDelegate {
	
	func didFetchData() {
		view?.showData()
	}
	
}
