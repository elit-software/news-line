import XCTest
@testable import NewsLine

class ParserTests: XCTestCase {
    func testExample() {

        let child1 = PassageData(name: "Step 2",
                                 content: "Double-click this passage to edit it.",
                                 next: [String]())
        let child2 = PassageData(name: "Step 3",
                                 content: "Double-click this passage to edit it.",
                                 next: [String]())

        let root = PassageData(name: "Step 1",
                               content: "Double-click this passage to edit it.",
                               next: [child1.name, child2.name])

        let passageData = [root,
                           child1,
                           child2]
        let content = Reader(name: "test", type: "html", bundle: Bundle(for: ParserTests.self)).read()
        let parser = Parser(content: content)

        let result = parser.parse()

        XCTAssertEqual(passageData, result)
    }
}
