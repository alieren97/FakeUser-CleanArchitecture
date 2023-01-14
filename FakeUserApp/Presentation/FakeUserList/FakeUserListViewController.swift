//
//  FakeUserListViewController.swift
//  FakeUserApp
//
//  Created by Gedikoglu, Ali on 11.01.2023.
//  
//

import UIKit
import DomainLayer

class FakeUserListViewController: UIViewController {
    private let mainView = FakeUserListView()
    // MARK: - Properties
    var presenter: ViewToPresenterFakeUserListProtocol?
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        presenter?.viewDidLoad()
        title = "Users"
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        tableViewSetup()
    }

    func tableViewSetup() {
        mainView.fakeUserListTableView.delegate = self
        mainView.fakeUserListTableView.dataSource = self
    }
}

extension FakeUserListViewController: PresenterToViewFakeUserListProtocol{
    func fetchFakeUsersSucceed(users: [DomainLayer.FakeUserEntity]) {
        mainView.fakeUserListTableView.reloadData()
    }
    // TODO: Implement View Output Methods
}


extension FakeUserListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.numberOfRowsInSection() ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = presenter?.userName(at: indexPath.row)
        cell.detailTextLabel?.text = presenter?.userCompanyName(at: indexPath.row)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        presenter?.didSelectRowAtUser(index: indexPath.row)
    }
}
