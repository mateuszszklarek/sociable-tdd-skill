protocol PhotoPresenterProtocol {
    func present(photoTitle: String, in view: DetailsView)
}

class PhotoPresenter: PhotoPresenterProtocol {

    func present(photoTitle: String, in view: DetailsView) {
        view.titleLabel.text = photoTitle
    }

}
