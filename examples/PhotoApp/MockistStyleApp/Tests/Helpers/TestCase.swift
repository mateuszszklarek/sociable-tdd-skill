@testable import MockistStyleApp
import XCTest

class TestCase: XCTestCase {
    override class func setUp() {
        super.setUp()
        mainDispatchQueue = { $0.perform() }
    }

    override class func tearDown() {
        mainDispatchQueue = DispatchQueue.main.async(execute:)
        super.tearDown()
    }
}
