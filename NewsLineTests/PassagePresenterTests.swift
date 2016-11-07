import XCTest
@testable import NewsLine

class PassagePresenterTests: XCTestCase {
    func testCurrentShowsFirstPassageData() {
        let data = Parser(content: Reader(name: "test", type: "html", bundle: Bundle(for: PassagePresenterTests.self)).read()).parse()
        let expected = [TableData(action: nil, content: "Double-click this passage to edit it."),
                        TableData(action: "Step 2", content: nil),
                        TableData(action: "Step 3", content: nil)]
        let presenter = PassagePresenter(data: data)

        XCTAssertEqual(expected, presenter.current)
    }

    func testAfterActionShowsInitialPassageDataPlusActionData() {
        let data = Parser(content: Reader(name: "test", type: "html", bundle: Bundle(for: PassagePresenterTests.self)).read()).parse()
        let expected = [TableData(action: nil, content: "Double-click this passage to edit it."),
                        TableData(action: "Step 2", content: nil),
                        TableData(action: "Step 3", content: nil),
                        TableData(action: nil, content: "Double-click this passage to edit it.")]

        let presenter = PassagePresenter(data: data)

        presenter.action(step: "Step 2")
        
        XCTAssertEqual(expected, presenter.current)
    }
}
