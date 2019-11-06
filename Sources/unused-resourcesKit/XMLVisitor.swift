import Foundation
import Path

public class XMLVisitor: NSObject {
    
    // attributes containing image name of UIImageView, UIButton, ...
    private let textHolderKeys = ["image"]
        
    public var images: [Path] = []
    
    public init(_ images: [Path]) {
        self.images = images
    }
    
    public func visit(_ source: Path) {
        guard let xmlParser = XMLParser(contentsOf: source.url) else {
            preconditionFailure("error: \(source.string) is not found.")
        }
        
        xmlParser.delegate = self
        xmlParser.parse()
    }
}

extension XMLVisitor: XMLParserDelegate {
    
    public func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        for textHolderKey in textHolderKeys {
            if let text = attributeDict[textHolderKey] {
                images = images.filter { $0.basename(dropExtension: true) != text }
            }
        }
    }
}
