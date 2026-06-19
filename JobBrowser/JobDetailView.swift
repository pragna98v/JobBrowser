//
//  JobDetailView.swift
//  JobBrowser
//
//  Created by Pragna R on 17/06/26.
//

import Foundation
import SwiftUI

struct JobDetailView : View {
    var jobModel : JobModel
    var body : some View {
        
        VStack(alignment:.leading,spacing: 5){
            Text(jobModel.title ?? "NA").font(.largeTitle)

            HStack {
                Image(systemName: "mappin.and.ellipse")
                Text(jobModel.location ?? "NA").font(.body)
            }
            VStack(alignment: .leading) {
                Text("Job Description").font(.title)
                Text(jobModel.description ?? "NA").font(.body)
            }
            VStack(alignment: .leading) {
                Text("About Company").font(.title)
                Text(jobModel.companyInfo ?? "NA").font(.body)
            }
            HStack {
                Text("SALARY: ").font(.title2)
                Text(jobModel.salaryRange ?? "NA").font(.body)
            }
            Spacer()


        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(10)
            .clipShape(RoundedRectangle(cornerRadius:  8))
            .background(Color.blue.opacity(0.6))
    }
}
