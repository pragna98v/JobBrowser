//
//  JobViewService.swift
//  JobBrowser
//
//  Created by Pragna R on 17/06/26.
//
import Foundation

protocol JobViewServiceDelegate {
    func getJobLists(completion:@escaping(Result<[JobModel],NetworKError>)-> Void)
}

class JobViewService : JobViewServiceDelegate{
    func getJobLists(completion:@escaping(Result<[JobModel],NetworKError>)-> Void){
        guard let url = URL(string : "http://localhost:3000/jobs") else {
            return completion(.failure(.BadURL))
        }
        if isConnected(){
            NetworkManager().fetchRequest(type: [JobModel].self, url: url, completion: completion)
        }
    }
    private func isConnected() -> Bool{
        return true
    }
}

