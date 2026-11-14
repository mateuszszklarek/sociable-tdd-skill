# Reliable tests and workflow

## Observe behavior through the consumer interface

Drive Red → Green through the fastest stable interface that exposes the agreed outcome. A model or handler can exercise behavior shared with the UI. Use a fast DOM or component test when it directly exposes what the user can see or do. Prefer assertions about visibility, actions, text, and accessible roles over exact markup. For a write that must persist, read through a fresh consumer of the same store. A writer's cached state can make an unsaved change appear successful.

Keep full browser and simulator UI tests outside the fast loop by default. When practical, check one representative path through the running UI separately to verify that the controls and visible result are wired up. A manual smoke check is sufficient when it verifies that path.

Name the scenario for the behavior it protects. Use an expectation from the requirement or an independently worked example. A failing assertion about the intended behavior establishes Red. A broken fixture or build failure needs to be resolved first. When refactoring existing behavior without prior coverage, a passing characterization test can establish a baseline.

## Keep the fast suite independent

Use fresh mutable fixtures, a per-test storage namespace, and per-test doubles. Use a real local resource when it is fast and preserves the behavior you need to verify. Pass explicit time or random inputs where they affect the result. Await observable completion or drive a scheduler local to the test. If order or concurrency might affect results, run the tests alone and together, and vary the order when the runner supports it.

Replace the smallest boundary that causes slow or unreliable feedback or state leakage. A transport substitute should have no route to the live network. Verify an outbound call when it expresses a promise, such as publishing an event once. Assert only the arguments, counts, and order the promise requires.

## Measure the feedback loop

Use a speed target that fits the project's normal edit-and-test loop. Cooper mentions a couple of minutes for his suite and later describes a 20-minute suite that developers would rarely run during TDD. His examples concern suite feedback time. [TDD, Where Did It All Go Wrong?](https://www.youtube.com/watch?v=EZ05e7EMOLM&t=2255s) · [TDD Revisited](https://www.youtube.com/watch?v=vOO3hulIcsY&t=3129s)

Time the focused test command and the routinely run suite on a representative setup. Repeat with comparable build and cache conditions. Use the median for typical feedback and look at slow runs for variability. Count build, startup, and fixture setup in the time developers wait, then use runner timings to locate the bottleneck. If speed is the reason for replacing a dependency, compare before and after under the same conditions and keep the double only if the gain justifies the loss of realism.

## Test doubles

| Type | Role |
| --- | --- |
| Dummy | Fills a required argument the scenario never uses. |
| Stub | Supplies a predetermined response, value, or error. |
| Spy | Records interactions for the test to inspect afterward. It can also supply a stubbed response. |
| Mock | Verifies expected interactions. |
| Fake | Provides a working, simplified implementation, such as an in-memory repository. Use a focused check with the real resource when differences in semantics matter. |

Name doubles for what they do in the scenario, regardless of the library that creates them.

## Optional Git checkpoints

If the user requests commits and the branch workflow permits checkpoints, save the runnable failing test, the change that makes it pass, and any subsequent refactor as separate commits. For example:

- `red: specify photo title display`
- `green: render the fetched title`
- `refactor: pass the photo to the presenter`

Run the relevant tests at each checkpoint. Keep Red local or squash it before sharing if the shared branch requires each commit to pass.
