//
//  FakeUserUseCase.swift
//  DomainLayer
//
//  Created by Gedikoglu, Ali on 7.01.2023.
//

import Foundation

public protocol FakeUserUseCaseInterface {
    func getUsers(handler: @escaping ([FakeUserEntity]) -> ())
}

public class FakeUserUseCase: FakeUserUseCaseInterface {

    let fakeUserDomainRepo: FakeUserDomainRepoInterface

        public init(fakeUserDomainRepo: FakeUserDomainRepoInterface) {
            self.fakeUserDomainRepo = fakeUserDomainRepo
        }

    public func getUsers(handler: @escaping ([FakeUserEntity]) -> ()) {
        fakeUserDomainRepo.getUsers { fakeUserList in
            handler(fakeUserList)
        }
    }
}

