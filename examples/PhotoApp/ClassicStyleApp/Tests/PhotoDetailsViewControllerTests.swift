@testable import ClassicStyleApp
import XCTest

class PhotoDetailsViewControllerTests: TestCase {

    var sut: PhotoDetailsViewController!
    var urlSessionSpy: URLSessionSpy!

    override func setUp() {
        super.setUp()
        urlSessionSpy = .init()
        sut = .init(id: 2, urlSession: urlSessionSpy)
    }

    override func tearDown() {
        sut = nil
        urlSessionSpy = nil
        super.tearDown()
    }

    func testViewIsLoaded_WhenFetchingPhotoDetailsSucceeds_PresentsPhotoTitleCorrectly() {
        sut.viewDidLoad()

        urlSessionSpy.dataTaskCalled?.completionHandler(stubbedJSON.data(using: .utf8)!, nil, nil)

        XCTAssertNotNil(sut.view.find(for: "Given photo title", by: \UILabel.text))
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
