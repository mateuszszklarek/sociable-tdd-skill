#if CLASSIC_STYLE
@testable import ClassicStyleApp
#else
@testable import MockistStyleApp
#endif
import Foundation
import Testing

@MainActor
struct URLSessionStub: URLSessionProtocol {
    let expectedURL: URL
    let json: String

    func dataTask(
        with url: URL,
        completionHandler: @escaping @MainActor @Sendable (Data?, URLResponse?, (any Error)?) -> Void
    ) -> URLSessionDataTask {
        StubDataTask {
            guard url == expectedURL else {
                Issue.record("Expected \(expectedURL), got \(url)")
                completionHandler(nil, nil, URLError(.unsupportedURL))
                return
            }
            let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)
            completionHandler(Data(json.utf8), response, nil)
        }
    }
}

private final class StubDataTask: URLSessionDataTask, @unchecked Sendable {
    private let onResume: @MainActor @Sendable () -> Void

    init(onResume: @escaping @MainActor @Sendable () -> Void) {
        self.onResume = onResume
        super.init()
    }

    override func resume() {
        // The service creates and starts the task on the main actor.
        MainActor.assumeIsolated { onResume() }
    }
}
