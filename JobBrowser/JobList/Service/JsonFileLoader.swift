//
//  JsonFileLoader.swift
//  JobBrowser
//
//  Created by Pragna R on 17/06/26.
//

import Foundation

class JsonFileLoader : JobViewServiceDelegate{
    func getJobLists(completion: @escaping (Result<[JobModel], NetworKError>) -> Void) {
        guard let url = Bundle.main.url(forResource: "jobsList", withExtension: "json") else {
            return completion(.failure(.BadURL) )

        }
        guard  let data = try? Data(contentsOf: url)  else {
            return completion(.failure(.NoData) )

        }
       
        guard let model = try? JSONDecoder().decode([JobModel].self, from: data) else {
         return completion(.failure(.DecodingError) )
        }
        completion(.success(model))
    }
    
}
