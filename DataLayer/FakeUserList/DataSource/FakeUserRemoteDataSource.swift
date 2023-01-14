//
//  FakeUserRemoteDataSource.swift
//  DataLayer
//
//  Created by Gedikoglu, Ali on 7.01.2023.
//

import Foundation
import Alamofire

public protocol FakeUserRemoteDataSourceInterace {
    init(urlString: String)

    func getUsers(handler: @escaping ([FakeUserModel]) -> ())
    func getUserDetail(id: Int, handler: @escaping (FakeUseDetailModel) -> ())
}

public class FakeUserRemoteDataSource: FakeUserRemoteDataSourceInterace {
    let urlString: String

    required public init(urlString: String) {
        self.urlString = "\(urlString)/users"
    }

    public func getUsers(handler: @escaping ([FakeUserModel]) -> ()) {
        AF.request(urlString, method: .get).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let objectResponse = try JSONDecoder().decode([FakeUserModel].self, from: data)
                    handler(objectResponse)
                } catch let error as Error {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
    }

    public func getUserDetail(id: Int, handler: @escaping (FakeUseDetailModel) -> ()) {
        let url = "\(urlString)/\(id)"
        AF.request(url, method: .get).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let objectResponse = try JSONDecoder().decode(FakeUseDetailModel.self, from: data)
                    handler(objectResponse)
                } catch let error as Error {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}


enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum MovieListEndpoint: String {
    case nowPlaying = "now_playing"
    case upcoming
    case topRated = "top_rated"
    case popular
}

final class FakeAPI {
    static let shared = FakeAPI()

    func request<T: Decodable>(dataType: T.Type, urlString: String, method: HTTPMethod, completion: @escaping (Result<T, Error>) -> Void) {
        let method = Alamofire.HTTPMethod(rawValue: method.rawValue)
        AF.request(urlString, method: method).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let objectResponse = try JSONDecoder().decode(dataType, from: data)
                    completion(.success(objectResponse))
                } catch let error as Error {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
