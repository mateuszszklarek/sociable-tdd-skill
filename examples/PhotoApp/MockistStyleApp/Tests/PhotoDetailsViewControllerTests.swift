@testable import MockistStyleApp
import Testing

@MainActor
struct PhotoDetailsViewControllerTests {
    @Test func openingThePhotoForwardsItsTitleToThePresenter() throws {
        let service = PhotoServiceSpy()
        let presenter = PhotoPresenterSpy()
        let screen = PhotoDetailsViewController(id: 1, photoService: service, photoPresenter: presenter)

        screen.loadViewIfNeeded()
        let request = try #require(service.fetchPhotoTitleCalls.last)
        request.completion("Given photo title")

        #expect(presenter.presentCalls.count == 1)
        #expect(presenter.presentCalls.last?.photoTitle == "Given photo title")
        #expect(presenter.presentCalls.last?.view === screen.view)
    }
}
