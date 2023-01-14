//
//  CustomLabel.swift
//  FakeUserApp
//
//  Created by Gedikoglu, Ali on 14.01.2023.
//

import Foundation
import UIKit
import SnapKit

final class CustomLabel: UIView {

    private lazy var containerView: UIView = {
        let view = UIView()
        view.addSubview(titleLabel)
        view.addSubview(textLabel)
        return view
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        return label
    }()

    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        return label
    }()

    var titleString: String? {
        didSet {
            titleLabel.text = titleString
        }
    }

    var textString: String? {
        didSet {
            textLabel.text = textString
        }
    }

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
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(70)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(20)
        }

        textLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(0)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(40)
        }
    }
}

