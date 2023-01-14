//
//  FakeUserDetailViewController.swift
//  FakeUserApp
//
//  Created by Gedikoglu, Ali on 11.01.2023.
//  
//

import UIKit
import DomainLayer

class FakeUserDetailViewController: UIViewController {

    private let mainView = FakeUserView()
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        presenter?.viewDidLoad()
    }

    // MARK: - Properties
    var presenter: ViewToPresenterFakeUserDetailProtocol?
    
}

extension FakeUserDetailViewController: PresenterToViewFakeUserDetailProtocol {
    func fetchFakeUserDetailSucceed(user: DomainLayer.FakeUserDetailEntity) {
        mainView.configure(user: user)
    }

    // TODO: Implement View Output Methods
}
