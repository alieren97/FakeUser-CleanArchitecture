//
//  FakeUserListPresenter.swift
//  FakeUserApp
//
//  Created by Gedikoglu, Ali on 11.01.2023.
//  
//

import Foundation
import DomainLayer

class FakeUserListPresenter: ViewToPresenterFakeUserListProtocol {

    // MARK: Properties
    var view: PresenterToViewFakeUserListProtocol?
    var interactor: PresenterToInteractorFakeUserListProtocol?
    var router: PresenterToRouterFakeUserListProtocol?

    private var fakeUserList: [FakeUserEntity]?

    func viewDidLoad() {
        interactor?.getFakeUsers()
    }

    func numberOfRowsInSection() -> Int {
        return fakeUserList?.count ?? 0
    }

    func userName(at index: Int) -> String? {
        fakeUserList?[index].name
    }

    func userCompanyName(at index: Int) -> String? {
        fakeUserList?[index].companyName
    }

    func didSelectRowAtUser(index: Int) {
        interactor?.getFakeUserDetail(at: index)
    }
    
}

extension FakeUserListPresenter: InteractorToPresenterFakeUserListProtocol {
    func getUser(user: DomainLayer.FakeUserEntity) {
        guard let userId = user.id else { return }
        router?.pushToUserDetail(on: view!, with: userId)
    }

    func getUserFailure(error: String) {
        print(error)
    }

    func fetchUsersSuccess(users: [DomainLayer.FakeUserEntity]) {
        self.fakeUserList = users
        view?.fetchFakeUsersSucceed(users: users)
    }

    func fetchUsersFailure(errorCode: Int) {
        print(errorCode)
    }
}
