# URLRewriter

[![CI Status](https://img.shields.io/travis/chinabrant/URLRewriter.svg?style=flat)](https://travis-ci.org/chinabrant/URLRewriter)
[![Version](https://img.shields.io/cocoapods/v/URLRewriter.svg?style=flat)](https://cocoapods.org/pods/URLRewriter)
[![License](https://img.shields.io/cocoapods/l/URLRewriter.svg?style=flat)](https://cocoapods.org/pods/URLRewriter)
[![Platform](https://img.shields.io/cocoapods/p/URLRewriter.svg?style=flat)](https://cocoapods.org/pods/URLRewriter)

## Introduce

通过正则表达式规则，将任意字符串改写。
```
pattern:
^(?:https?:)\\/\\/test.(com|test)\\/product\\/([0-9]*).html$

target:
myappScheme://host.mobile/goodsDetail?goodsId=$2

input:
http://test.com/product/2345.html
```

如上，可以将input通过动态配置的pattern改写成target.

## Example
```swift
let rule = RewriteRule(pattern: "^(?:https?:)\\/\\/test.(com|test)\\/product\\/([0-9]*).html$", target: "myappScheme://host.mobile/goodsDetail?goodsId=$2", flag: nil)

URLRewriter.instance.updateRules(rules: [rule])

let result = URLRewriter.instance.rewriteUrl(url: "http://test.com/product/2345.html")
```

## Requirements

## Installation

URLRewriter is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'URLRewriter'
```

## Author

chinabrant, sjwu1234@gmail.com

## License

URLRewriter is available under the MIT license. See the LICENSE file for more info.
