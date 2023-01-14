//
//  FakeUserListContract.swift
//  FakeUserApp
//
//  Created by Gedikoglu, Ali on 11.01.2023.
//  
//

import Foundation
import DomainLayer

// MARK: View Output (Presenter -> View)
protocol PresenterToViewFakeUserListProtocol {
    func fetchFakeUsersSucceed(users: [FakeUserEntity])
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterFakeUserListProtocol {
    
    var view: PresenterToViewFakeUserListProtocol? { get set }
    var interactor: PresenterToInteractorFakeUserListProtocol? { get set }
    var router: PresenterToRouterFakeUserListProtocol? { get set }

    func viewDidLoad()
    func numberOfRowsInSection() -> Int
    func userName(at index: Int) -> String?
    func userCompanyName(at index: Int) -> String?
    func didSelectRowAtUser(index: Int)
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorFakeUserListProtocol {
    
    var presenter: InteractorToPresenterFakeUserListProtocol? { get set }

    func getFakeUsers()
    func getFakeUserDetail(at index: Int)
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterFakeUserListProtocol {
    func fetchUsersSuccess(users: [FakeUserEntity])
    func fetchUsersFailure(errorCode: Int)

    func getUser(user: FakeUserEntity)
    func getUserFailure(error: String)
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterFakeUserListProtocol {
    func pushToUserDetail(on view: PresenterToViewFakeUserListProtocol, with userId: Int)
}
