import XCTest
@testable import NewsLine

class PassagePresenterTests: XCTestCase {
    func testCurrentShowsFirstPassageData() {
        let data = Parser(content: Reader(name: "test", type: "html", bundle: Bundle(for: PassagePresenterTests.self)).read()).parse()
        let root = [PassageData(name: "Step 1",
                               content: "Double-click this passage to edit it.",
                               next: ["Step 2", "Step 3"])]
        
        let presenter = PassagePresenter(data: data)

        XCTAssertEqual(root, presenter.current)
    }

    func testAfterActionShowsInitialPassageDataPlusActionData() {
        let data = Parser(content: Reader(name: "test", type: "html", bundle: Bundle(for: PassagePresenterTests.self)).read()).parse()
        let root = PassageData(name: "Step 1",
                               content: "Double-click this passage to edit it.",
                               next: ["Step 2", "Step 3"])
        let child1 = PassageData(name: "Step 2",
                                 content: "Double-click this passage to edit it.",
                                 next: [String]())
        let expected = [root, child1]
        let presenter = PassagePresenter(data: data)

        presenter.action(step: "Step 2")
        
        XCTAssertEqual(expected, presenter.current)
    }
}
