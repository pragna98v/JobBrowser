//
//  JobModel.swift
//  JobBrowser
//
//  Created by Pragna R on 17/06/26.
//

struct JobModel : Codable,Identifiable{
    let id : String?
    let title : String?
    let companyName : String?
    let location : String?
    let salaryRange : String?
    let description : String?
    let companyInfo : String?
    
    enum CodingKeys : String, CodingKey {
        case id , title
        case companyName = "company"
        case location, description
        case salaryRange = "salary_range"
        case companyInfo = "company_info"
    }
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.companyName = try container.decodeIfPresent(String.self, forKey: .companyName)
        self.location = try container.decodeIfPresent(String.self, forKey: .location)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.salaryRange = try container.decodeIfPresent(String.self, forKey: .salaryRange)
        self.companyInfo = try container.decodeIfPresent(String.self, forKey: .companyInfo)
    }


}
