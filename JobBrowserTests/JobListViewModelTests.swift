//
//  JobListViewModelTests.swift
//  JobBrowserTests
//
//  Created by Pragna R on 18/06/26.
//

import XCTest
@testable import JobBrowser
final class JobListViewModelTests: XCTestCase {

    func testjobs() {
        let sut = JobListViewModel(serviceHandler: MockJobViewService())
        sut.fetchJobList()
        print("Result =", sut.jobList.count)

        XCTAssert(sut.jobList.count == 100)
    }

}
