//
//  MockJobViewService.swift
//  JobBrowserTests
//
//  Created by Pragna R on 18/06/26.
//

import Foundation
@testable import JobBrowser

class MockJobViewService : JobViewServiceDelegate {
    func getJobLists(completion: @escaping (Result<[JobBrowser.JobModel], JobBrowser.NetworKError>) -> Void) {
        
        guard let jsonData = readLocalJsonFile() else {
            completion(.failure(.NoData))
            return
        }
        do {
            let obj = try  JSONDecoder().decode([JobModel].self, from: jsonData)
            completion(.success(obj))
        } catch let error {
            print(error)
            completion(.failure(.DecodingError))
        }
    }
    
    private func readLocalJsonFile() -> Data? {
        do {
            guard let fileUrl =  Bundle.main.url(forResource: "jobsList", withExtension: "json") else {
                print("bad")
                return nil
            }
            let data = try Data(contentsOf: fileUrl)
            return data
        } catch let error {
            print(error.localizedDescription)
            return nil
        }
    }
}
