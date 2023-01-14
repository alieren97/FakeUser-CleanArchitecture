//
//  FakeUserDetailInteractor.swift
//  FakeUserApp
//
//  Created by Gedikoglu, Ali on 11.01.2023.
//  
//

import Foundation
import DomainLayer

class FakeUserDetailInteractor: PresenterToInteractorFakeUserDetailProtocol {

    // MARK: Properties
    private var fakeUserDetailUseCase: FakeUserDetailUseCaseInterface
    private var user: FakeUserDetailEntity?
    var userID: Int?
    var presenter: InteractorToPresenterFakeUserDetailProtocol?

    init(fakeUserDetailUseCase: FakeUserDetailUseCaseInterface) {
        self.fakeUserDetailUseCase = fakeUserDetailUseCase
    }

    func getUserDetail() {
        self.fakeUserDetailUseCase.getUserDetail(id: userID ?? 0) { [weak self] user in
            self?.presenter?.getUserDetail(user: user)
        }
    }
}
