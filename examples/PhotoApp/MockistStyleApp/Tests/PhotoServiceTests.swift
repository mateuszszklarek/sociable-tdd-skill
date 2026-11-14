@testable import MockistStyleApp
import Foundation
import Testing

@MainActor
struct PhotoServiceTests {
    @Test func fetchingAPhotoReturnsItsTitle() {
        let urlSession = URLSessionStub(
            expectedURL: URL(string: "https://jsonplaceholder.typicode.com/photos/1")!,
            json: """
            {"id": 1, "title": "Given photo title"}
            """
        )
        let service = PhotoService(urlSession: urlSession)
        var title: String?

        service.fetchPhotoTitle(id: 1) { title = $0 }

        #expect(title == "Given photo title")
    }
}
