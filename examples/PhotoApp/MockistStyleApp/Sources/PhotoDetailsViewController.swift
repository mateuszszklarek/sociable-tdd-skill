import UIKit

final class PhotoDetailsViewController: UIViewController {

    private let id: Int
    private let photoService: PhotoServiceProtocol
    private let photoPresenter: PhotoPresenterProtocol

    init(
        id: Int,
        photoService: PhotoServiceProtocol,
        photoPresenter: PhotoPresenterProtocol
    ) {
        self.id = id
        self.photoService = photoService
        self.photoPresenter = photoPresenter
        super.init(nibName: nil, bundle: nil)
    }

    private lazy var detailsView = DetailsView()

    override func loadView() {
        view = detailsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        photoService.fetchPhotoTitle(id: id) { [weak self] title in
            guard let self else { return }
            photoPresenter.present(photoTitle: title, in: detailsView)
        }
    }

    required init?(coder: NSCoder) { nil }

}
