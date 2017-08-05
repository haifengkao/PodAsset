//
//  PodAssetTests.m
//  PodAssetTests
//
//  Created by Hai Feng Kao on 04/06/2016.
//  Copyright (c) 2016 Hai Feng Kao. All rights reserved.
//

// https://github.com/kiwi-bdd/Kiwi

#import "PodAsset.h"
#import "hello.h"

SPEC_BEGIN(InitialTests)

describe(@"Pod asset tests", ^{
    context(@"will pass", ^{
        it(@"find the damn resources", ^{
            NSString* bundlePath  = [[NSBundle bundleForClass:[self class]] pathForResource:@"TestPod" ofType:@"bundle"];
            NSString* frameworkPath  = [[NSBundle bundleForClass:[self class]] pathForResource:@"FrameworkPod" ofType:@"bundle"];
            hello* h = [hello new];
            NSString* frameworkPath2  = [[NSBundle bundleForClass:[h class]] pathForResource:@"FrameworkPod" ofType:@"bundle"];
            NSLog(@"bundlePath: %@", bundlePath);
            NSLog(@"frameworkPath: %@", frameworkPath);
            NSLog(@"frameworkPath2: %@", frameworkPath2);

            NSData* frameData = [PodAsset dataForFilename:@"test2.json" pod:@"FrameworkPod"];
            NSAssert(frameData, @"should get the data");

            NSData* data = [PodAsset dataForFilename:@"test.json" pod:@"TestPod"];
            NSAssert(data, @"should get the data");
            
            NSString* str = [PodAsset stringForFilename:@"test.json" pod:@"TestPod"];
            NSAssert(str, @"should get the json string");

            NSString* path = [PodAsset pathForFilename:@"test.json" pod:@"TestPod"];
            NSLog(@"resource path: %@", path);

            NSArray* array = [PodAsset assetsInPod:@"TestPod"];
            [[@(array.count) should] beGreaterThan:@0];

            // NSArray* array2 = [PodAsset assetsInPod:@"FrameworkPod"];
            
            // PodAsset_Example.app contains both TestPod and FrameworkPod, so the return values should be the content of PodAsset_Example.app
            // [[array should] equal:array2];
            
            // test non-existing file
            NSData* notExist = [PodAsset dataForFilename:@"no-this-file.json" pod:@"TestPod"];
            NSAssert(!notExist, @"should not get the data");
            
            // test bundle
            NSBundle* bundle = [PodAsset bundleForPod:@"TestPod"];
            NSAssert(bundle, @"should get the bundle");
            
            // test framework
            NSBundle* framework = [PodAsset bundleForPod:@"FrameworkPod"];
            NSAssert(framework, @"should get the framework");

        });
    });
});

SPEC_END

