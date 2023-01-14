//
//  FakeUserDetailModel.swift
//  DataLayer
//
//  Created by Gedikoglu, Ali on 12.01.2023.
//

import Foundation
import DomainLayer

public struct FakeUseDetailModel: Codable {
    let id: Int?
    let name: String?
    let username: String?
    let email: String?
    let address: Address?
    let company: Company?
    let phone: String?
    let website: String?

    public func toFakeUserDetailModelEntity () -> FakeUserDetailEntity {
        return FakeUserDetailEntity(id: id, name: name, companyName: company?.name, username: username, email: email, address: "\(address?.city),\(address?.street)", phone: phone, website: website)
    }
}

public struct Address: Codable {
    let street: String?
    let suite: String?
    let city: String?
    let zipcode: String?
    let location: Location?
}

public struct Location: Codable {
    let lat: String?
    let lng: String?
}


