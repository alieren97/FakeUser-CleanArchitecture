//
//  FakeUserDetailRouter.swift
//  FakeUserApp
//
//  Created by Gedikoglu, Ali on 11.01.2023.
//  
//

import Foundation
import UIKit
import DomainLayer

class FakeUserDetailRouter: PresenterToRouterFakeUserDetailProtocol {

    // MARK: Static methods
    static func createModule(with userId: Int) -> UIViewController {
        
        let viewController = FakeUserDetailViewController()
        
        let presenter: ViewToPresenterFakeUserDetailProtocol & InteractorToPresenterFakeUserDetailProtocol = FakeUserDetailPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = FakeUserDetailRouter()
        viewController.presenter?.view = viewController

        viewController.presenter?.interactor = FakeUserDetailInteractor(fakeUserDetailUseCase: Resolver().resolve(FakeUserDetailUseCaseInterface.self))
        viewController.presenter?.interactor?.userID = userId
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
