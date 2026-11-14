# Choosing tests

Use the change and its risks to decide what to run and what to keep.

| If you need to… | Do this |
| --- | --- |
| Implement a behavior or reproduce a bug | Write a runnable example through the consumer's interface. Use real collaborators where practical. For a fix, observe the reported behavior fail before changing production code. Keep the test in the fast suite. |
| Check a rule with many edge cases | List distinct outcomes, boundary cases, and combinations where conditions affect each other. Exercise each meaningful case through the smallest stable interface that exposes the rule. Cross-check the branches against the tests. For each decision that affects behavior, identify which test would fail if the decision were handled incorrectly. Let the existing tests cover helpers introduced during refactoring. |
| Learn how an unfamiliar API, SDK, or algorithm behaves | Ask a specific question and write a temporary script or test to answer it. Record the finding and discard the probe. Carry any lasting requirement into a regression test at the appropriate boundary. |
| Verify a real adapter or provider contract | Keep a focused integration check for a risk that controlled responses cannot reveal, such as wire format, transaction behavior, or a provider changing its responses. Run it against a controlled environment. |
| Verify deployment or a critical journey | Use a smoke check for essential wiring or availability. Use an end-to-end check where a whole journey must work through the assembled system. Cover most behavior variations with faster tests. |

## How test labels overlap

| Term | What it tells you |
| --- | --- |
| Developer test | A test that gives developers feedback as they design or change behavior, in Ian Cooper’s terminology. |
| Sociable unit test | Exercises a behavior through a stable interface with real collaborators where practical. A unit can span several classes or functions. |
| Solitary unit test | Exercises a unit with its collaborators replaced by doubles. |
| Focused integration test | Checks whether a boundary works, such as an adapter talking to a database or a client honoring a provider contract. Use the real dependency when its behavior is the risk. |
| End-to-end test | Exercises a complete journey through the assembled system. |
| Smoke test | Checks that a small set of essential paths works after building or deploying. It can also be end-to-end. |
| Exploratory probe | Answers a specific question. It can use a real integration. Discard it after learning and keep a focused regression check if there is a lasting risk. |

Describe what the test exercises and what risk it covers when the team's labels differ. [Ian Cooper on developer tests](https://www.linkedin.com/posts/ian-cooper-2b059b_tdd-where-did-it-all-go-wrong-ian-cooper-activity-7122656233995517953-hwvS) · [Martin Fowler on integration tests](https://martinfowler.com/bliki/IntegrationTest.html)

## Optional check for weak assertions

When reviewing a risky rule, run the focused tests in a temporary copy against a change that would break the behavior. For example, change `>=` to `>` and see whether a test catches the difference at the boundary value. Restore the production code afterward. If the change matters to a caller and the suite passes, add or strengthen a behavior test. If it has no observable effect, leave the tests alone. Use a mutation testing tool when broader sampling is useful. Keep this check outside the normal Red, Green, Refactor loop. [Stryker on mutation testing](https://stryker-mutator.io/docs/)

## Example: Show a message when a photo is missing

In the demo app, opening a photo's detail screen fetches the photo from an API and displays its title. Suppose the screen needs to show a message when the API cannot find the requested photo. If the provider's response is unclear, use a one-off sandbox request to learn what it returns. Record the status and response shape, along with what the app is supposed to show.

Write the test through the screen's normal entry point. Give the real screen code a controlled response at the transport boundary and assert the visible message. Run it before the change and confirm the assertion fails. Implement the handling and rerun the test. Keep the same assertion through a presenter refactor.

Discard the sandbox probe after it answers the question. Keep a separate integration check only if the project needs to detect a real provider or adapter failure. The screen test with a stub establishes what the app does when it receives the response.

Cooper discusses discarding temporary implementation probes in his original talk and using real integration feedback with targeted regression coverage in the follow-up. [Original talk, 58:52](https://www.youtube.com/watch?v=EZ05e7EMOLM&t=3532s) · [TDD Revisited, 51:20](https://www.youtube.com/watch?v=vOO3hulIcsY&t=3080s)
