//
//  FakeUserListView.swift
//  FakeUserApp
//
//  Created by Gedikoglu, Ali on 12.01.2023.
//

import Foundation
import UIKit
import SnapKit

final class FakeUserListView: UIView {

    private lazy var containerView: UIView = {
        let view = UIView()
        view.addSubview(fakeUserListTableView)
        return view
    }()

    lazy var fakeUserListTableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 70
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        setupLayouts()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        addSubview(containerView)
    }

    private func setupLayouts() {
        containerView.snp.makeConstraints { $0.edges.equalToSuperview() }
        fakeUserListTableView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
}

