import XCTest

import fibTests

var tests = [XCTestCaseEntry]()
tests += fibTests.allTests()
XCTMain(tests)
