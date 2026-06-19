//
//  JobListViewModel.swift
//  JobBrowser
//
//  Created by Pragna R on 17/06/26.
//
import Combine
import Foundation

class JobListViewModel : ObservableObject {
    
    let serviceHandler : JobViewServiceDelegate
    let jsonFileLoader : JsonFileLoader
    @Published var jobList = [JobModel]()
    @Published var searchText: String = ""

    var filteredJobsList : [JobModel]{

            guard !searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
                return jobList
            }

        return jobList.filter {
            ($0.title?.localizedCaseInsensitiveContains(searchText) ?? false) ||
            ($0.companyName?.localizedCaseInsensitiveContains(searchText) ?? false)
        }
            
        
    }

    init(serviceHandler: JobViewServiceDelegate = JobViewService(), jsonFileLoader : JsonFileLoader = JsonFileLoader()) {
        self.serviceHandler = serviceHandler
        self.jsonFileLoader = jsonFileLoader
    }
    
    func fetchJobList(){
        if isConnected() {
            serviceHandler.getJobLists(completion: { result in
                DispatchQueue.main.async{
                    switch result {
                    case .success(let jobs):
                        self.jobList = jobs
                    case .failure(let error):
                        print(error)
                    }
                }
            })
        }else {
            jsonFileLoader.getJobLists(completion: { result in
                DispatchQueue.main.async{
                    switch result {
                    case .success(let jobs) :
                        self.jobList = jobs
                    case .failure(let error) :
                        print(error)
                        
                    }
                }
            })
        }
    }
    
    //update return value to true - if want to load from url
    // Used mockonn for json
    //false - to load json file
    private func isConnected() -> Bool{
        return false
    }
}
                        
