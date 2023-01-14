//
//  FakeUserEntity.swift
//  DomainLayer
//
//  Created by Gedikoglu, Ali on 7.01.2023.
//

import Foundation
import UIKit

public struct FakeUserEntity: Identifiable {
    public let id: Int?
    public let name: String?
    public let companyName: String?

    public init(id: Int?, name: String?, companyName: String?) {
        self.id = id
        self.name = name
        self.companyName = companyName
    }
}
