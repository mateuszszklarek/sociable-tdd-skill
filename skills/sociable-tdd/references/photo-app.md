# Photo app example

Use this example when a test verifies calls between internal collaborators or breaks after a refactor that preserves the behavior. In the Swift demo, opening a photo's detail screen fetches the requested photo and displays its title.

## Choose the assertion

The mockist controller test supplies a title through a photo service spy and verifies what the presenter spy receives. That test can pass when the title never appears. The sociable test exercises the real controller, service, decoder, presenter, and view. It supplies a controlled response at the transport boundary and checks the title displayed on screen.

Apply that approach to a feature or regression:

1. Configure a fresh URL session stub with a literal JSON response for the requested photo. Reject unexpected requests so a wrong photo ID cannot yield the expected title.
2. Open the screen through its normal lifecycle. Await the observable update or drive a scheduler local to the test.
3. Assert the title shown to the user. For a new behavior or bug fix, run the test before changing production code and confirm that this assertion detects the missing or incorrect behavior.

The demo substitutes `URLSessionProtocol` at the network boundary. The stub returns an in-memory task that delivers literal JSON when the service calls `resume()`. Normal app runs use `URLSession.shared`.

## Check whether the test survives the refactor

The repository starts with both variants passing a title `String` internally. To reproduce the refactor, run both schemes first and make the following changes in a temporary branch or copy.

1. In each variant, rename `fetchPhotoTitle` to `fetchPhoto`. Change the completion to take a `Photo` and return the decoded object. Have the controller forward that object to `present(photo:in:)` and let the presenter read its title. In the mockist variant, update the service and presenter protocols with the same signatures.
2. Run both schemes with the original tests. The classic suite still runs and verifies the displayed title. The mockist suite fails to compile because its tests and spies use the old signatures.
3. Update the mockist service spy to supply a `Photo` and the presenter spy to record it. Adjust the controller test to supply a photo and assert its title, the service test to read the returned photo's title, and the presenter test to pass a photo. Run both schemes again. The requested photo, sample response, and displayed title are the same throughout.

| Files affected by this refactor | Mockist variant | Sociable variant |
| --- | --- | --- |
| Production | Controller, service, presenter | Controller, service, presenter |
| Test files | Three. The controller, service, and presenter tests depend on the old handoff. | Zero. The scenario supplies the same response and verifies the same title. |
| Test doubles | Two. The service spy and presenter spy depend on the old signatures. | Zero. The transport interface stays the same. |

During a similar refactor, rerun the original behavior test and inspect any failure before changing the assertion.
