//
//  JobListView.swift
//  JobBrowser
//
//  Created by Pragna R on 17/06/26.
//

import SwiftUI

struct JobListView: View {
    @ObservedObject private var  viewModel = JobListViewModel()
    @State private var searchText = ""
    var body: some View {
        NavigationView{
            VStack {
                List{
                    ForEach(viewModel.filteredJobsList){ job in
                        NavigationLink { JobDetailView(jobModel: job)
                        }
                         label: {
                            JobRow(jobModel: job)
                         }.listRowBackground(Color.blue.opacity(50))
                        
                    }
                }.listRowSpacing(5)
                    

            }
            
            .padding(0)
            .clipShape(Rectangle())
            .searchable(text:$viewModel.searchText , placement: .navigationBarDrawer(displayMode: .always),prompt: "")
            .onAppear{
                viewModel.fetchJobList()
            }
//            .task(id: searchText) {
//                print(searchText)
//                viewModel.searchJobs(with: searchText)
//            }
        }.navigationTitle("Jobs List")
            .cornerRadius(0)
    }
}

#Preview {
    JobListView()
}
