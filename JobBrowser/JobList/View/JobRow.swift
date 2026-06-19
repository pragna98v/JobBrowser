//
//  JobRow.swift
//  JobBrowser
//
//  Created by Pragna R on 17/06/26.
//

import Foundation
import SwiftUI

struct JobRow : View{
    var jobModel : JobModel
    var body : some View {
        VStack(alignment: .leading) {
            Text(jobModel.title ?? "NA").font(.title)
            Text(jobModel.companyName ?? "NA").font(.headline)
            Text(jobModel.location ?? "NA")
            Text(jobModel.salaryRange ?? "NA")

        }
         .padding(5)
         .frame(maxWidth: .infinity, alignment: .leading)
         .cornerRadius(0)
    }
}
//
//struct JobRow_Previews : PreviewProvider{
//    static var previews: some View {
//        JobRow(jobModel: JobModel(id: "1", title: "iOS Developer", companyName: "Tezminds Pvt limited", location: "Pune,India", salaryRange: "1500000-1800000",description: "Test", companyInfo: "ABC Company"))
//    }
//}
