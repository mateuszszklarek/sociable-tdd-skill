@MainActor
protocol PhotoPresenterProtocol {
    func present(photoTitle: String, in view: DetailsView)
}

@MainActor
final class PhotoPresenter: PhotoPresenterProtocol {

    func present(photoTitle: String, in view: DetailsView) {
        view.titleLabel.text = photoTitle
    }

}
