import Testing

@MainActor
struct PhotoPresenterTests {
    @Test func presentingATitleDisplaysItInTheView() {
        let view = DetailsView()

        PhotoPresenter().present(photoTitle: "Given photo title", in: view)

        #expect(view.visibleLabelTexts.contains("Given photo title"))
    }
}
