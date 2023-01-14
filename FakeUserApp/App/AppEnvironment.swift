//
//  AppEnvironment.swift
//  AppLayer
//
//  Created by Gedikoglu, Ali on 7.01.2023.
//

import Foundation

class AppEnvironment {
    lazy var apiBaseURL: String = {
        guard let apiBaseURL = Bundle.main.object(forInfoDictionaryKey: "ApiBaseURL") as? String else {
            fatalError("ApiBaseURL must not be empty in plist")
        }
        print(apiBaseURL)
        return apiBaseURL
    }()
}
