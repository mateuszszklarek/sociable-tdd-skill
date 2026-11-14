import UIKit

final class PhotoDetailsViewController: UIViewController {

    private let id: Int
    private let photoService: PhotoService
    private let photoPresenter: PhotoPresenter

    init(id: Int, urlSession: any URLSessionProtocol) {
        self.id = id
        self.photoService = .init(urlSession: urlSession)
        self.photoPresenter = .init()
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
