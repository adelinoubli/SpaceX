//
//  Resouces.swift
//  SpaceX
//
//  Created by Adel on 9/21/23.
//

import Foundation

struct Resources {
    
//    struct Authentication {
//        static func getRequestToken() -> Resource<DataModel.Authentication.Token> {
//            return .init(
//                url: .init(fromTMDBPath: "/3/authentication/token/new")!,
//                httpMethod: .get
//            )
//        }
//
//        static func validateRequestTokenWithLogin(credentials: RequestData.Credentials) -> Resource<DataModel.Authentication.Token> {
//            return .init(
//                url: .init(fromTMDBPath: "/3/authentication/token/validate_with_login")!,
//                httpMethod: .post(credentials)
//            )
//        }
//
//        static func createSession(requestToken: RequestData.RequestToken) -> Resource<DataModel.Authentication.Session> {
//            return .init(
//                url: .init(fromTMDBPath: "/3/authentication/session/new")!,
//                httpMethod: .post(requestToken)
//            )
//        }
//    }
    
    struct LauncheResource {
        static func getList() -> Resource<Launches> {
            return .init(
                url: .init(fromPath: API.launches)!,
                httpMethod: .get
            )
        }
    }
}

extension URL {
    init?(fromPath path: String, requireAuthentication: Bool = false) {
        guard var urlComponents = URLComponents(string: API.baseURL) else { return nil }
        urlComponents.path = path
        //In case we API_KEY to access the resource
        if requireAuthentication {
            urlComponents.queryItems = [
                URLQueryItem(name: "api_key", value: String(API.apiKey)),
            ]
        }
        guard let url = urlComponents.url else { return nil }
        self = url
    }
}
