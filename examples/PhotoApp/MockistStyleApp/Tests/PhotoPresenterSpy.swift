@MainActor
final class PhotoPresenterSpy: PhotoPresenterProtocol {
    private(set) var presentCalls: [(photoTitle: String, view: DetailsView)] = []

    func present(photoTitle: String, in view: DetailsView) {
        presentCalls.append((photoTitle, view))
    }
}
