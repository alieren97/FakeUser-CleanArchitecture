//
//  FakeUserListRouter.swift
//  FakeUserApp
//
//  Created by Gedikoglu, Ali on 11.01.2023.
//  
//

import Foundation
import UIKit
import DomainLayer

class FakeUserListRouter: PresenterToRouterFakeUserListProtocol {

    // MARK: Static methods
    func createModule(fakeUserUseCase: FakeUserUseCaseInterface) -> UIViewController {
        let viewController = FakeUserListViewController()

        let presenter: ViewToPresenterFakeUserListProtocol & InteractorToPresenterFakeUserListProtocol = FakeUserListPresenter()

        viewController.presenter = presenter
        viewController.presenter?.router = FakeUserListRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = FakeUserListInteractor(fakeUserUseCase: fakeUserUseCase)
        viewController.presenter?.interactor?.presenter = presenter

        return viewController
    }

    func pushToUserDetail(on view: PresenterToViewFakeUserListProtocol, with userId: Int) {
        let coffeeDetailViewController = FakeUserDetailRouter.createModule(with: userId)
        let viewController = view as! FakeUserListViewController
        viewController.navigationController?
            .pushViewController(coffeeDetailViewController, animated: true)
    }

}
