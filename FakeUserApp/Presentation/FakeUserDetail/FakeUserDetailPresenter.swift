//
//  FakeUserDetailPresenter.swift
//  FakeUserApp
//
//  Created by Gedikoglu, Ali on 11.01.2023.
//  
//

import Foundation
import DomainLayer

class FakeUserDetailPresenter: ViewToPresenterFakeUserDetailProtocol {

    // MARK: Properties
    var view: PresenterToViewFakeUserDetailProtocol?
    var interactor: PresenterToInteractorFakeUserDetailProtocol?
    var router: PresenterToRouterFakeUserDetailProtocol?

    private var userDetail: FakeUserDetailEntity?

    func viewDidLoad() {
        interactor?.getUserDetail()
    }
}

extension FakeUserDetailPresenter: InteractorToPresenterFakeUserDetailProtocol {
    func getUserDetail(user: DomainLayer.FakeUserDetailEntity) {
        self.userDetail = user
        view?.fetchFakeUserDetailSucceed(user: user)
    }

    func getUserFailure(error: String) {
        print(error)
    }
}
