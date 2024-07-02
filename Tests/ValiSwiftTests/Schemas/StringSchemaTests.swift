// write tests for the string schema

import XCTest

@testable import ValiSwift

final class StringSchemaTests: XCTestCase {
  func testStringSchema() {
    struct TestIssue: StringIssue {
      var kind: String
      var type: String
      var expected: String
      var message: String
    }

    struct TestSchema: StringSchema {
      var kind: String
      var type: String
      var reference: Any.Type
      var expects: String
      var async: Bool
      var message: String?

      func _run(dataset: inout Dataset<String, TestIssue>, config: Any) -> Dataset<
        String, TestIssue
      > {
        return dataset
      }
    }

    var dataset = Dataset<String, TestIssue>(value: "test", typed: false)
    let schema = TestSchema(
      kind: "string", type: "string", reference: String.self, expects: "test", async: false,
      message: nil)
    _addIssue(schema, "test", &dataset, "test")
  }
}
