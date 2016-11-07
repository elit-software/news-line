import XCTest
@testable import NewsLine

class PassageDataParserTests: XCTestCase {
    func testExample() {
        let passageData = [PassageData(name: "Step 1", content: "Double-click this passage to edit it. \n[[Step 2-&gt;Step 2]]\n[[Step 3-&gt;Step 3]]"),
                           PassageData(name: "Step 2", content: "Double-click this passage to edit it."),
                           PassageData(name: "Step 3", content: "Double-click this passage to edit it.")
                           ]
        let content = Reader(name: "test", type: "html", bundle: Bundle(for: PassageDataParserTests.self)).read()
        let parser = Parser(content: content)

        let result = parser.parse()

        XCTAssertEqual(passageData, result)
    }
}
