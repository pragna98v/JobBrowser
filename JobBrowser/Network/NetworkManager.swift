//
//  NetworkManager.swift
//  JobBrowser
//
//  Created by Pragna R on 17/06/26.
//
import UIKit

enum NetworKError : Error {
    case BadURL
    case NoData
    case DecodingError
}

class NetworkManager {
    let apiHandler : APIHandlerDelegate
    let responseHandler: ResponseHandlerDelegate
    
    init(apiHandler: APIHandlerDelegate = APIHandlerDelegate(), responseHandler: ResponseHandlerDelegate = ResponseHandlerDelegate()) {
        self.apiHandler = apiHandler
        self.responseHandler = responseHandler
    }
    
    func fetchRequest<T:Codable>(type : T.Type , url:URL ,completion: @escaping(Result<T, NetworKError>) -> Void){
      
        apiHandler.fetchData(url: url, completion: {result in
            switch result {
            case .success(let data):
                self.responseHandler.fetchModels(type:type,data: data, completion: {
                    decodedResult in
                    switch decodedResult{
                    case .success(let model):
                        completion(.success(model))
                    case .failure(let error) :
                        completion(.failure(error))
                    }
                    
                })
            case .failure(let error):
                completion(.failure(error))
            }
        })
       
    }
}

class APIHandlerDelegate{
    func fetchData(url : URL, completion: @escaping(Result<Data, NetworKError>) -> Void){
    
        URLSession.shared.dataTask(with: url) { data, response , error in
            guard let data = data else {
                return completion(.failure(.NoData))
            }
            return completion(.success(data))
        }.resume()
    }
}

class ResponseHandlerDelegate{
    func fetchModels<T: Codable>(type: T.Type,data : Data, completion: @escaping(Result<T, NetworKError>) -> Void){
            let listResponse = try? JSONDecoder().decode(type.self, from: data)
            if let listResponse = listResponse {
                return completion(.success(listResponse))
            }else {
                return completion(.failure(.DecodingError))
            }
    }
}
