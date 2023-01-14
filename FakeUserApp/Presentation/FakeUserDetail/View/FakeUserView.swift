//
//  FakeUserView.swift
//  FakeUserApp
//
//  Created by Gedikoglu, Ali on 14.01.2023.
//

import Foundation
import UIKit
import SnapKit
import DomainLayer

final class FakeUserView: UIView {

    private lazy var container: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.addSubview(userName)
        view.addSubview(fakeUserName)
        view.addSubview(companyName)
        view.addSubview(userEmail)
        view.addSubview(userPhoneNumber)
        return view
    }()

    private lazy var userName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return label
    }()

    private lazy var fakeUserName: CustomLabel = {
        let label = CustomLabel()
        label.titleString = "Fake Username"
        return label
    }()

    private lazy var companyName: CustomLabel = {
        let label = CustomLabel()
        label.titleString = "Company Name"
        return label
    }()

    private lazy var userEmail: CustomLabel = {
        let label = CustomLabel()
        label.titleString = "Email"
        return label
    }()

    private lazy var userPhoneNumber: CustomLabel = {
        let label = CustomLabel()
        label.titleString = "Phone Number"
        return label
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
        addSubview(container)
    }

    private func setupLayouts() {
        container.snp.makeConstraints { $0.edges.equalToSuperview() }

        userName.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(150)
            make.trailing.leading.equalToSuperview().inset(20)
        }

        fakeUserName.snp.makeConstraints { make in
            make.top.equalTo(userName.snp.bottom).offset(40)
            make.height.equalTo(70)
            make.leading.trailing.equalToSuperview()
        }

        companyName.snp.makeConstraints { make in
            make.top.equalTo(fakeUserName.snp.bottom).offset(20)
            make.height.equalTo(70)
            make.leading.trailing.equalToSuperview()
        }

        userEmail.snp.makeConstraints { make in
            make.top.equalTo(companyName.snp.bottom).offset(20)
            make.height.equalTo(70)
            make.leading.trailing.equalToSuperview()
        }

        userPhoneNumber.snp.makeConstraints { make in
            make.top.equalTo(userEmail.snp.bottom).offset(20)
            make.height.equalTo(70)
            make.leading.trailing.equalToSuperview()
        }
    }

    func configure(user: FakeUserDetailEntity) {
        userName.text = user.name
        fakeUserName.textString = user.username
        companyName.textString = user.companyName
        userEmail.textString = user.email
        userPhoneNumber.textString = user.phone
    }
}

