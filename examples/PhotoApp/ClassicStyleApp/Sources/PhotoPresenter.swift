@MainActor
final class PhotoPresenter {

    func present(photoTitle: String, in view: DetailsView) {
        view.titleLabel.text = photoTitle
    }

}
