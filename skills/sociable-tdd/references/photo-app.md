# Photo app example

Use this example when a test verifies calls between internal collaborators or breaks after a refactor that preserves the behavior. In the Swift demo, opening a photo's detail screen fetches the requested photo and displays its title.

## Choose the assertion

The mockist controller test supplies a title through a photo service spy and verifies what the presenter spy receives. That test can pass when the title never appears. The sociable test exercises the real controller, service, decoder, presenter, and view. It supplies a controlled response at the transport boundary and checks the title displayed on screen.

Apply that approach to a feature or regression:

1. Configure a fresh transport stub to return a known title for the requested photo. Reject unexpected requests so a wrong photo ID cannot yield the expected title.
2. Open the screen through its normal lifecycle. Await the observable update or drive a scheduler local to the test.
3. Assert the title shown to the user. For a new behavior or bug fix, run the test before changing production code and confirm that this assertion detects the missing or incorrect behavior.

The checked-in demo illustrates where to assert. Its transport spy creates a real task that the service resumes, and its test harness overrides a global dispatcher. For a reliable test, use a transport stub with no path to live I/O and keep control of asynchronous work local to each test.

## Check whether the test survives the refactor

Imagine changing the service and presenter to pass a decoded `Photo` through the controller in place of a title string. The response and displayed title stay the same.

| Files affected by this refactor | Mockist variant | Sociable variant |
| --- | --- | --- |
| Production | Controller, service, presenter | Controller, service, presenter |
| Test files | Three. The controller, service, and presenter tests depend on the old handoff. | Zero. The scenario supplies the same response and verifies the same title. |
| Test doubles | Two. The service spy and presenter spy depend on the old signatures. | Zero. The transport interface stays the same. |

This count comes from tracing the refactor against the checked-in source. During a similar refactor, rerun the original behavior test and inspect any failure before changing the assertion.
