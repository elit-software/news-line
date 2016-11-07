import XCTest
@testable import NewsLine

class PassageBuilderTests: XCTestCase {
    func testExample() {

        let child1 = PassageData(name: "Step 2",
                                 content: "Double-click this passage to edit it.",
                                 next: [String]())
        let child2 = PassageData(name: "Step 3",
                                 content: "Double-click this passage to edit it.",
                                 next: [String]())

        let root = PassageData(name: "Step 1",
                               content: "Double-click this passage to edit it.",
                               next: [child1.name, child2.name] )

        let parser = PassageBuilder(name: root.name,
                                   content: "Double-click this passage to edit it.\n\n[[Step 2->Step 2]]\n[[Step 3->Step 3]]")

        let result = parser.build()

        XCTAssertEqual(root.name, result.name)
        XCTAssertEqual(root.content, result.content)
        XCTAssertEqual(root.next, result.next)
    }
}

