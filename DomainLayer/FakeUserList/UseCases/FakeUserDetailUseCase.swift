//
//  FakeUserDetailUseCase.swift
//  DomainLayer
//
//  Created by Gedikoglu, Ali on 12.01.2023.
//

import Foundation

public protocol FakeUserDetailUseCaseInterface {
    func getUserDetail(id: Int, handler: @escaping (FakeUserDetailEntity) -> ())
}

public class FakeUserDetailUseCase: FakeUserDetailUseCaseInterface {

    let fakeUserDomainRepo: FakeUserDomainRepoInterface

        public init(fakeUserDomainRepo: FakeUserDomainRepoInterface) {
            self.fakeUserDomainRepo = fakeUserDomainRepo
        }

    public func getUserDetail(id: Int, handler: @escaping (FakeUserDetailEntity) -> ()) {
        fakeUserDomainRepo.getUserDetail(id: id) { fakeUser in
            handler(fakeUser)
        }
    }
}

