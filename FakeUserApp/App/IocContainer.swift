//
//  IocContainer.swift
//  AppLayer
//
//  Created by Gedikoglu, Ali on 9.01.2023.
//

import Foundation
import Swinject
import DomainLayer
import DataLayer

func buildContainer() -> Container {
    let container = Container()

//    let dbWrapper = CoreDataWrapper()

//    container.register(FakeUserUseCaseInterface.self){ _ in
//        return FakeUserUseCase()
//    }.inObjectScope(.container)

    container.register(FakeUserDomainRepoInterface.self){ _ in
        return FakeUserRepository(
            remoteDataSource: container.resolve(FakeUserRemoteDataSourceInterace.self)! as! FakeUserRemoteDataSource,
            localDataSource: container.resolve(FakeUserLocalDataSourceInterface.self)! as! FakeUserLocalDataSource
        )
    }.inObjectScope(.container)

    container.register(FakeUserRemoteDataSourceInterace.self){ _ in
        return FakeUserRemoteDataSource(urlString: AppEnvironment.init().apiBaseURL)
    }.inObjectScope(.container)

    container.register(FakeUserLocalDataSourceInterface.self){ _ in
        return FakeUserLocalDataSource()
    }.inObjectScope(.container)

    container.register(FakeUserUseCaseInterface.self){ _ in
        return FakeUserUseCase(fakeUserDomainRepo: container.resolve(FakeUserDomainRepoInterface.self)!)
    }.inObjectScope(.container)

    container.register(FakeUserDetailUseCaseInterface.self){ _ in
        return FakeUserDetailUseCase(fakeUserDomainRepo: container.resolve(FakeUserDomainRepoInterface.self)!)
    }.inObjectScope(.container)
    
    return container

}
