//
//  FakeUserRepository.swift
//  DataLayer
//
//  Created by Gedikoglu, Ali on 7.01.2023.
//

import Foundation
import DomainLayer

public class FakeUserRepository: FakeUserDomainRepoInterface {
    let remoteDataSource: FakeUserRemoteDataSource
    let localDataSource: FakeUserLocalDataSource?

    public init(remoteDataSource: FakeUserRemoteDataSource, localDataSource: FakeUserLocalDataSource? = nil) {
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
        }

    public func getUsers(handler: @escaping ([DomainLayer.FakeUserEntity]) -> ()) {
        remoteDataSource.getUsers { (fakeUserList) in
            var userEntities = [FakeUserEntity]()
            for list in fakeUserList {
                userEntities.append(list.toFakeUserModelEntity())
            }
            handler(userEntities)
        }
    }

    public func getUserDetail(id: Int, completion: @escaping (DomainLayer.FakeUserDetailEntity) -> ()) {
        remoteDataSource.getUserDetail(id: id) { fakeUser in
            let userEntity = fakeUser.toFakeUserDetailModelEntity()
            completion(userEntity)
        }
    }
}
