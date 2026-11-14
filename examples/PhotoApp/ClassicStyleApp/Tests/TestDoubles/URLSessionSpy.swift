@testable import ClassicStyleApp
import Foundation

class URLSessionSpy: URLSessionProtocol {

    var dataTaskCalled: (url: URL, completionHandler: (Data?, URLResponse?, Error?) -> Void)?

    func dataTask(
        with url: URL,
        completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void
    ) -> URLSessionDataTask {
        let task = URLSession.shared.dataTask(with: url)
        dataTaskCalled = (url, completionHandler)

        return task
    }

}
