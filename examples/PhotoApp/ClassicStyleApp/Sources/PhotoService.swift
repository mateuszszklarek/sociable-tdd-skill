import Foundation

@MainActor
final class PhotoService {
    private let urlSession: any URLSessionProtocol

    init(urlSession: any URLSessionProtocol) {
        self.urlSession = urlSession
    }

    func fetchPhotoTitle(id: Int, completion: @escaping (String) -> Void) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/photos/\(id)")!
        let task = urlSession.dataTask(with: url) { data, response, _ in
            guard let data, let response = response as? HTTPURLResponse,
                  (200..<300).contains(response.statusCode),
                  let photo = try? JSONDecoder().decode(Photo.self, from: data) else {
                return
            }
            completion(photo.title)
        }
        task.resume()
    }
}
