import UIKit

class PhotoDetailsViewController: UIViewController {

    private let id: Int
    private let photoService: PhotoService
    private let photoPresenter: PhotoPresenter

    init(id: Int, urlSession: URLSessionProtocol) {
        self.id = id
        self.photoService = .init(urlSession: urlSession)
        self.photoPresenter = .init()
        super.init(nibName: nil, bundle: nil)
    }

    private(set) lazy var detailsView = DetailsView()

    override func loadView() {
        view = detailsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        photoService.fetchPhotoTitle(id: id) { [weak self, detailsView] photoTitle in
            let workItem = DispatchWorkItem {
                self?.photoPresenter.present(photoTitle: photoTitle, in: detailsView)
            }
            mainDispatchQueue(workItem)
        }
    }

    required init?(coder: NSCoder) { nil }

}
