@MainActor
final class PhotoServiceSpy: PhotoServiceProtocol {
    private(set) var fetchPhotoTitleCalls: [(id: Int, completion: (String) -> Void)] = []

    func fetchPhotoTitle(id: Int, completion: @escaping (String) -> Void) {
        fetchPhotoTitleCalls.append((id, completion))
    }
}
