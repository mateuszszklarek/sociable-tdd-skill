@testable import MockistStyleApp
import XCTest

class PhotoDetailsViewControllerTests: TestCase {

    var sut: PhotoDetailsViewController!
    var photoServiceSpy: PhotoServiceSpy!
    var photoPresenterSpy: PhotoPresenterSpy!

    override func setUp() {
        super.setUp()
        photoServiceSpy = .init()
        photoPresenterSpy = .init()
        sut = .init(id: 1, photoService: photoServiceSpy, photoPresenter: photoPresenterSpy)
    }

    override func tearDown() {
        sut = nil
        photoServiceSpy = nil
        photoPresenterSpy = nil
        super.tearDown()
    }

    func testViewIsLoaded_WhenFetchingPhotoDetailsSucceeds_PresentsPhotoTitleCorrectly() {
        sut.loadViewIfNeeded()

        photoServiceSpy.fetchPhotoTitleCalls.last?.completion("Given photo title")

        XCTAssertEqual(photoPresenterSpy.presentCalls.count, 1)
        XCTAssertEqual(photoPresenterSpy.presentCalls.last?.photoTitle, "Given photo title")
        XCTAssertEqual(photoPresenterSpy.presentCalls.last?.inView, sut.view)
    }

}
