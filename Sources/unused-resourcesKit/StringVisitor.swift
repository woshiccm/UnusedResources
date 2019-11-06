import SwiftSyntax
import Path

public struct StringVisitor: SyntaxVisitor {
    
    public var images: [Path] = []
        
    public init(_ images: [Path]) {
        self.images = images
    }
    
    // Ignore string interpolated literal because it's too complex to compare
    public mutating func visit(_ node: StringLiteralExprSyntax) -> SyntaxVisitorContinueKind {
        guard node.segments.count == 1 else {
            return .skipChildren
        }
        return .visitChildren
    }
    
    public mutating func visit(_ node: StringSegmentSyntax) -> SyntaxVisitorContinueKind {
        let text = node.content.text
            .trimmingCharacters(in: .whitespacesAndNewlines)
        guard !text.isEmpty else {
            return .skipChildren
        }

        images = images.filter { $0.basename(dropExtension: true) != text }

        return .skipChildren
    }
    
    // for Objective-C
    public mutating func visit(_ token: TokenSyntax) -> SyntaxVisitorContinueKind {
        switch token.tokenKind {
        case .stringLiteral(let text):
            images = images.filter { !text.contains($0.basename(dropExtension: true)) }
        default:
            break
        }
        
        return .visitChildren
    }
}
