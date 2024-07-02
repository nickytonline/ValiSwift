protocol StringIssue: BaseIssue {
  associatedtype UnknownType

  /// The issue kind.
  var kind: IssueKind { get }

  /// The issue type.
  var type: String { get }

  /// The expected property.
  var expected: String { get }
}

extension StringIssue {
  var kind: IssueKind { .schema }
}
