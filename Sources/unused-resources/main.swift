import unused_resourcesKit
import Path
import SwiftSyntax

let imageExtensions: [String] = ["png", "jpg", "gif", "pdf"]
let xmlExtensions: [String] = ["xib", "storyboard"]

guard CommandLine.arguments.count > 1, let path = Path(CommandLine.arguments[1]) else {
    fatalError("You should provide a folder")
}

var images: [Path] = try recursiveFiles(withExtensions: imageExtensions, at: path)
var files: [Path] = try recursiveFiles(withExtensions: ["swift", "h", "m", "mm"], at: path)
var xmlFiles: [Path] = try recursiveFiles(withExtensions: xmlExtensions, at: path)

for file in files {
    let syntax = try SyntaxParser.parse(file.url)
    var visitor = StringVisitor(images)
    syntax.walk(&visitor)
    images = visitor.images
}

let xmlVisitor = XMLVisitor(images)
for file in xmlFiles {
    xmlVisitor.visit(file)
}
images = xmlVisitor.images

for image in images {
    print("\(image.basename()) in \(image.parent.string)")
}
