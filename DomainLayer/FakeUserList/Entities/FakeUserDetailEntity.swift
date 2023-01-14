//
//  FakeUserDetailEntity.swift
//  DomainLayer
//
//  Created by Gedikoglu, Ali on 12.01.2023.
//

import Foundation
import UIKit

public struct FakeUserDetailEntity: Identifiable {
    public let id: Int?
    public let name: String?
    public let companyName: String?
    public let username: String?
    public let email: String?
    public let addressName: String?
    public let phone: String?
    public let website: String?

    public init(id: Int?, name: String?, companyName: String?, username: String?, email: String?, address: String?, phone: String?, website: String?) {
        self.id = id
        self.name = name
        self.companyName = companyName
        self.username = username
        self.email = email
        self.addressName = address
        self.phone = phone
        self.website = website
    }
}


