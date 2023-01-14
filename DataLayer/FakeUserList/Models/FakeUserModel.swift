//
//  FakeUserModel.swift
//  DataLayer
//
//  Created by Gedikoglu, Ali on 7.01.2023.
//

import Foundation
import DomainLayer

public struct FakeUserModel: Codable {
    let id: Int?
    let name: String?
    let company: Company?

    public func toFakeUserModelEntity () -> FakeUserEntity {
        return FakeUserEntity(id: id, name: name, companyName: company?.name)
    }
}

public struct Company: Codable {
    let name: String?
}

