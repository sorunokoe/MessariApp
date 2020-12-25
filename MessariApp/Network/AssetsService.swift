//
//  AssetsService.swift
//  MessariApp
//
//  Created by Yeskendir Salgara on 25.12.2020.
//

import Moya

enum AssetsService {
    case getAssets(page: Int, limit: Int)
    case getMetrics(id: String, type: String, start: String, end: String)
}
extension AssetsService: TargetType {
    var baseURL: URL {
        return URL(string: "\(Environment.state.baseAPIURL)/api/v1")!
    }
    
    var path: String {
        switch self {
        case .getAssets:
            return "/assets"
        case .getMetrics(let id, let type, _, _):
            return "/assets/\(id)/metrics/\(type)/time-series"
        }
    }
    
    var method: Method {
        switch self {
        case .getAssets, .getMetrics:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getAssets(let page, let limit):
            let params = [
                "page": page,
                "limit": limit
            ]
            return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
        case .getMetrics(_, _, let start, let end):
            let params = [
                "start": start,
                "end": end
            ]
            return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String: String]? {
        return ["x-messari-api-key": Environment.state.apiKey]
    }
}
