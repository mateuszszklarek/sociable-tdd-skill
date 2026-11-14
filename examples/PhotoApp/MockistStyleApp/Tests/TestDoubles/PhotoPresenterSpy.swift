@testable import MockistStyleApp

class PhotoPresenterSpy: PhotoPresenterProtocol {

    private(set) var presentCalls: [(photoTitle: String, inView: DetailsView)] = []

    func present(photoTitle: String, in view: DetailsView) {
        presentCalls.append((photoTitle, view))
    }

}
