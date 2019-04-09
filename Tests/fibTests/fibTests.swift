import XCTest
import class Foundation.Bundle

final class fibTests: XCTestCase {

    static var allTests = [
        ("testFiveIsFive", testFiveIsFive),
        ("testNoArgIsZero", testNoArgIsZero),
        ("testOneIsOne", testOneIsOne),
        ("testTwoIsOne", testTwoIsOne),
        ("testThreeIsTwo", testThreeIsTwo),
        ("testFourIsThree", testFourIsThree),
        ("testFiveIsFive", testFiveIsFive),
        ("testSixIsEight", testSixIsEight),
        ("test1024IsRidiculous", test1024IsRidiculous),
    ]

    lazy var subjectUrl = productsDirectory.appendingPathComponent("fib")

    var subject: Process!
    var subjectStdOut: Pipe!
    var subjectStdErr: Pipe!

    override func setUp() {
        subject = Process()
        subject.executableURL = subjectUrl

        subjectStdOut = Pipe()
        subject.standardOutput = subjectStdOut

        subjectStdErr = Pipe()
        subject.standardError = subjectStdErr
    }

    func testNoArgIsZero() throws {
        try assertRun(inputArg: nil, shouldResult: "0")
    }

    func testZeroIsZero() throws {
        try assertRun(inputArg: "0", shouldResult: "0")
    }

    func testOneIsOne() throws {
        try assertRun(inputArg: "1", shouldResult: "1")
    }

    func testTwoIsOne() throws {
        try assertRun(inputArg: "2", shouldResult: "1")
    }

    func testThreeIsTwo() throws {
        try assertRun(inputArg: "3", shouldResult: "2")
    }

    func testFourIsThree() throws {
        try assertRun(inputArg: "4", shouldResult: "3")
    }

    func testFiveIsFive() throws {
        try assertRun(inputArg: "5", shouldResult: "5")
    }

    func testSixIsEight() throws {
        try assertRun(inputArg: "6", shouldResult: "8")
    }

    func test1024IsRidiculous() throws {
        try assertRun(inputArg: "1024", shouldResult: "4506699633677819813104383235728886049367860596218604830803023149600030645708721396248792609141030396244873266580345011219530209367425581019871067646094200262285202346655868899711089246778413354004103631553925405243")
    }

    private var productsDirectory: URL {
      #if os(macOS)
        for bundle in Bundle.allBundles where bundle.bundlePath.hasSuffix(".xctest") {
            return bundle.bundleURL.deletingLastPathComponent()
        }
        fatalError("couldn't find the products directory")
      #else
        return Bundle.main.bundleURL
      #endif
    }

    private func readStdOut() -> String {
        let data = subjectStdOut.fileHandleForReading.readDataToEndOfFile()
        return String(data: data, encoding: .utf8) ?? ""
    }

    private func readStdErr() -> String {
        let data = subjectStdErr.fileHandleForReading.readDataToEndOfFile()
        return String(data: data, encoding: .utf8) ?? ""
    }

    private func assertRun(inputArg: String?, shouldResult: String) throws {
        if let arg = inputArg { subject.arguments = [arg] }
        try subject.run()
        subject.waitUntilExit()
        let output = readStdOut()
        let error = readStdErr()
        XCTAssertEqual(output, "\(shouldResult)\n")
        XCTAssertTrue(error.isEmpty)
    }
}
