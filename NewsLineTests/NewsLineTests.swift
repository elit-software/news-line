import XCTest
@testable import NewsLine

class PassageDataParserTests: XCTestCase {
    func testExample() {
        let root = PassageData(name: "Step 1",
                               content: "Double-click this passage to edit it.\n\n[[Step 2->Step 2]]\n[[Step 3->Step 3]]",
                               next: [PassageData]())
        let child1 = PassageData(name: "Step 2",
                                 content: "Double-click this passage to edit it.",
                                 next: [PassageData]())
        let child2 = PassageData(name: "Step 3",
                                 content: "Double-click this passage to edit it.",
                                 next: [PassageData]())
        let passageData = [root,
                           child1,
                           child2]
        let content = Reader(name: "test", type: "html", bundle: Bundle(for: PassageDataParserTests.self)).read()
        let parser = Parser(content: content)

        let result = parser.parse()

        XCTAssertEqual(passageData, result)
    }
}
