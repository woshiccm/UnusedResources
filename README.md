# UnusedResources

UnusedResources is a simple command line tool for detact unused images in Xcode.


The project uses [SwiftSyntax](https://github.com/apple/swift-syntax).


## Installation

clone the repo and run `make install`

With that installed and on our `bin` folder, now we can use it.

## Usage

Just run the command passing the folder to your source files.

```sh
unused-resources /path/to/our/source/files/
```

## Example

```
mingdeMacBook-Pro:~ ming$ unused-resources /Users/ming/Desktop/UnusedResourcesTest 
testPNG.png in /Users/ming/Desktop/UnusedResourcesTest/UnusedResourcesTest/Assets.xcassets/testPNG.imageset
testJPG.jpg in /Users/ming/Desktop/UnusedResourcesTest/UnusedResourcesTest/Assets.xcassets/testJPG.imageset

```


## Licence
UnusedResources is released under the [MIT License](https://opensource.org/licenses/MIT).

