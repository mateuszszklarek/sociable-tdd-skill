@testable import MockistStyleApp
import XCTest

class PhotoPresenterTests: XCTestCase {

    var sut: PhotoPresenter!

    override func setUp() {
        super.setUp()
        sut = .init()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testPresentPhotoTitle_DisplaysPhotoTitleCorrectly() {
        let view = DetailsView()

        sut.present(photoTitle: "Given photo title", in: view)

        XCTAssertNotNil(view.find(for: "Given photo title", by: \UILabel.text))
    }

}
