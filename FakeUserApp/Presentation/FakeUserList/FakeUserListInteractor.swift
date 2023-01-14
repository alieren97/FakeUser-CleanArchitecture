//
//  FakeUserListInteractor.swift
//  FakeUserApp
//
//  Created by Gedikoglu, Ali on 11.01.2023.
//  
//

import Foundation
import DomainLayer

class FakeUserListInteractor: PresenterToInteractorFakeUserListProtocol {

    private var fakeUserUseCase: FakeUserUseCaseInterface
    private var users: [FakeUserEntity]?

    init(fakeUserUseCase: FakeUserUseCaseInterface) {
        self.fakeUserUseCase = fakeUserUseCase
    }

    // MARK: Properties
    var presenter: InteractorToPresenterFakeUserListProtocol?

    func getFakeUsers() {
        self.fakeUserUseCase.getUsers { [weak self] (userArray) in
            self?.users = userArray
            self?.presenter?.fetchUsersSuccess(users: userArray)
        }
    }

    func getFakeUserDetail(at index: Int) {
        guard let users = self.users, users.indices.contains(index) else {
            presenter?.getUserFailure(error: "not found")
            return
        }
        presenter?.getUser(user: users[index])
    }
}
