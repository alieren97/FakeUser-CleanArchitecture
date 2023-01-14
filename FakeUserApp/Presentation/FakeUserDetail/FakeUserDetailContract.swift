//
//  FakeUserDetailContract.swift
//  FakeUserApp
//
//  Created by Gedikoglu, Ali on 11.01.2023.
//  
//

import Foundation
import DomainLayer

// MARK: View Output (Presenter -> View)
protocol PresenterToViewFakeUserDetailProtocol {
    func fetchFakeUserDetailSucceed(user: FakeUserDetailEntity)
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterFakeUserDetailProtocol {
    
    var view: PresenterToViewFakeUserDetailProtocol? { get set }
    var interactor: PresenterToInteractorFakeUserDetailProtocol? { get set }
    var router: PresenterToRouterFakeUserDetailProtocol? { get set }

    func viewDidLoad()
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorFakeUserDetailProtocol {
    var userID: Int? { get set }
    var presenter: InteractorToPresenterFakeUserDetailProtocol? { get set }

    func getUserDetail()
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterFakeUserDetailProtocol {
    func getUserDetail(user: FakeUserDetailEntity)
    func getUserFailure(error: String)
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterFakeUserDetailProtocol {
    
}
