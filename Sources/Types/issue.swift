enum IssueKind: String {
  case schema
  case validation
  case transformation
}

protocol Config {}

// Replace with actual type if known
typealias IssuePathItem = Any

enum PathItemType {
  case array
}

enum PathItemOrigin {
  case value
}

// Array path item type.
protocol ArrayPathItem {
  // The path item type.
  var type: PathItemType { get }

  // The path item origin.
  var origin: PathItemOrigin { get }

  // The path item input.
  var input: [Any] { get }

  // The path item key.
  var key: Int { get }

  // The path item value.
  var value: Any { get }
}

extension ArrayPathItem {
  var type: PathItemType { .array }
  var origin: PathItemOrigin { .value }
}

protocol BaseIssue: Config {
  associatedtype TInput

  // The issue kind.
  var kind: IssueKind { get }

  // The issue type.
  var type: String { get }

  // The raw input data.
  var input: TInput { get }

  // The expected property.
  var expected: String? { get }

  // The received property.
  var received: String { get }

  // The error message.
  var message: String { get }

  // The input requirement.
  var requirement: Any? { get }

  // The issue path.
  //
  // TODO: Investigate if it is possible to make the path type safe based on the
  // input.
  var path: [IssuePathItem]? { get }

  // The sub issues.
  var issues: [BaseIssue]? { get }
}
