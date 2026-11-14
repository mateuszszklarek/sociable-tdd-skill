import Foundation

@MainActor
protocol URLSessionProtocol {
    func dataTask(
        with url: URL,
        completionHandler: @escaping @MainActor @Sendable (Data?, URLResponse?, (any Error)?) -> Void
    ) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol {
    func dataTask(
        with url: URL,
        completionHandler: @escaping @MainActor @Sendable (Data?, URLResponse?, (any Error)?) -> Void
    ) -> URLSessionDataTask {
        // URLSession invokes its callback off the main actor. Deliver results to the UI on it.
        let callback: @Sendable (Data?, URLResponse?, (any Error)?) -> Void = { data, response, error in
            Task { @MainActor in
                completionHandler(data, response, error)
            }
        }
        return dataTask(with: url, completionHandler: callback)
    }
}
