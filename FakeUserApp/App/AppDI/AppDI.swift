//
//  AppDI.swift
//  AppLayer
//
//  Created by Gedikoglu, Ali on 7.01.2023.
//

import Foundation
import UIKit

protocol AppDIInterface {
    func fakeUserListDependencies() -> UIViewController
}


class AppDI: AppDIInterface {

    static let shared = AppDI(appEnvironment: AppEnvironment())

    let appEnvironment: AppEnvironment

    init(appEnvironment: AppEnvironment) {
        self.appEnvironment = appEnvironment
    }

    func fakeUserListDependencies() -> UIViewController {

        let fakeUserDI: FakeUserDI = FakeUserDI(appEnvironment: appEnvironment)

        let fakeUserRouter = fakeUserDI.fakeUserDependencies()

        return fakeUserRouter
    }

}
