# PodAsset

[![CI Status](http://img.shields.io/travis/haifengkao/PodAsset.svg?style=flat)](https://travis-ci.org/haifengkao/PodAsset)
[![Coverage Status](https://codecov.io/gh/haifengkao/PodAsset/branch/master/graph/badge.svg)](https://codecov.io/gh/haifengkao/PodAsset)
[![Version](https://img.shields.io/cocoapods/v/PodAsset.svg?style=flat)](http://cocoapods.org/pods/PodAsset)
[![License](https://img.shields.io/cocoapods/l/PodAsset.svg?style=flat)](http://cocoapods.org/pods/PodAsset)
[![Platform](https://img.shields.io/cocoapods/p/PodAsset.svg?style=flat)](http://cocoapods.org/pods/PodAsset)

## Usage

Why is it so painful to access the assets in CocoaPods? 
Pain No More!

Get the damn image:
```Swift
// Swift
import PodAsset

let bundle = PodAsset.bundle(forPod: "SomePod")
let img = UIImage(named: "SomeDamnImage", in:bundle, compatibleWith:nil)
```

```objc
// Objective-C
@import PodAsset;

NSBundle* bundle = [PodAsset bundleForPod:@"SomePod"];
UIImage* img = [UIImage imageNamed:@"SomeDamnImage" inBundle:bundle compatibleWithTraitCollection:nil];
```

Get the damn data:
```swift
// Swift
let data = PodAsset.data(forFilename: "SomeData.dat", pod: "SomePod")
```

```objc
// Objective-C
NSData* data = [PodAsset dataForFilename:@"SomeData.dat" pod:@"SomePod"];
```
Get the damn json:
```swift
// Swift
let jsonString = PodAsset.string(forFilename: "SomeDamn.json", pod: "SomePod")
```

```objc
// Objective-C
NSString* jsonString = [PodAsset stringForFilename:@"SomeDamn.json" pod:@"SomePod"];
```

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
The resource bundle name, by default, is the pod name. 
If not, please check the third party pod's podspec and find out the resource bundle name:
```ruby
  s.resource_bundles = {
    'PodAsset' => ['Pod/Assets/*.png']
  }
```
In the above example, the bundle name is `PodAsset`.

## Installation

PodAsset is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "PodAsset"
```

## How It works

Pod Asset will search all bundles and find the correct one.

If you don't want to use PodAsset, you can still find the correct bundle by `bundleForClass:`.

If the pod is loaded as a dynamic framework, locate its bundle by:
``` objc
[NSBundle bundleForClass:[some class which is defined in your pod]]
```

If the pod is loaded as a static bundle, locate its bundle by:
``` objc
[NSBundle mainBundle] 
```
or
``` objc
[NSBundle bundleForClass:[some class in your app]].
```

## Author

Hai Feng Kao, haifeng@cocoaspice.in

## License

PodAsset is available under the MIT license. See the LICENSE file for more info.
