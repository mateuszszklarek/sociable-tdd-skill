import Foundation
import Testing

@MainActor
struct PhotoDetailsViewControllerTests {
    @Test func openingThePhotoDisplaysItsTitle() {
        let urlSession = URLSessionStub(
            expectedURL: URL(string: "https://jsonplaceholder.typicode.com/photos/2")!,
            json: """
            {"id": 2, "title": "Given photo title"}
            """
        )
        let screen = PhotoDetailsViewController(id: 2, urlSession: urlSession)

        screen.loadViewIfNeeded()

        #expect(screen.view.visibleLabelTexts.contains("Given photo title"))
    }
}
