@testable import MockistStyleApp
import XCTest

class PhotoServiceTests: XCTestCase {

    var sut: PhotoService!
    var urlSessionSpy: URLSessionSpy!

    override func setUp() {
        super.setUp()
        urlSessionSpy = .init()
        sut = .init(urlSession: urlSessionSpy)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testFetchPhotoTitle_WhenSucceeds_ReturnsCorrectName() {
        var receivedPhotoTitle: String?

        sut.fetchPhotoTitle(id: 1) { photoTitle in
            receivedPhotoTitle = photoTitle
        }

        urlSessionSpy.dataTaskCalled?.completionHandler(stubbedJSON.data(using: .utf8), nil, nil)

        XCTAssertEqual(receivedPhotoTitle, "Given photo title")
    }

    private var stubbedJSON: String {
        """
        {
            "albumId": 1,
            "id": 1,
            "title": "Given photo title",
            "url": "https://via.placeholder.com/600/92c952",
            "thumbnailUrl": "https://via.placeholder.com/150/92c952"
        }
        """
    }

}
