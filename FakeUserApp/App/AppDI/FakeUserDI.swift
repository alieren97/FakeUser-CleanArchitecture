//
//  FakeUserDI.swift
//  AppLayer
//
//  Created by Gedikoglu, Ali on 7.01.2023.
//

import Foundation
import DomainLayer
import DataLayer
import UIKit

class FakeUserDI {
    let appEnvironment: AppEnvironment

    init(appEnvironment: AppEnvironment) {
        self.appEnvironment = appEnvironment
    }

    func fakeUserDependencies() -> UIViewController {
        let fakeUserUseCase = Resolver().resolve(FakeUserUseCaseInterface.self)
        let router = FakeUserListRouter().createModule(fakeUserUseCase: fakeUserUseCase)
        return router
    }

}
