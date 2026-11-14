import Foundation

protocol PhotoServiceProtocol {
    func fetchPhotoTitle(id: Int, completion: @escaping (String) -> Void)
}

class PhotoService: PhotoServiceProtocol {

    private let urlSession: URLSessionProtocol

    init(urlSession: URLSessionProtocol) {
        self.urlSession = urlSession
    }

    func fetchPhotoTitle(id: Int, completion: @escaping (String) -> Void) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/photos/\(id)")!
        let dataTask = urlSession.dataTask(with: url) { data, response, error in
            if let data = data {
                let photo = try! JSONDecoder().decode(Photo.self, from: data)
                completion(photo.title)
            }

        }

        dataTask.resume()
    }

}
