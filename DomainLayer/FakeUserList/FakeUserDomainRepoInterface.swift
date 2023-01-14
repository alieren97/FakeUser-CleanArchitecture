//
//  FakeUserDomainRepoInterface.swift
//  DomainLayer
//
//  Created by Gedikoglu, Ali on 7.01.2023.
//

import Foundation

public protocol FakeUserDomainRepoInterface {
    func getUsers(handler: @escaping ([FakeUserEntity]) -> ())
    func getUserDetail(id: Int, completion: @escaping (FakeUserDetailEntity) -> ())
}

