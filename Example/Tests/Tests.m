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
            [[@(frameData.length) should] beGreaterThan:@(0)];

            NSData* data = [PodAsset dataForFilename:@"test.json" pod:@"TestPod"];
            [[@(data.length) should] beGreaterThan:@(0)];
            
            NSString* str = [PodAsset stringForFilename:@"test.json" pod:@"TestPod"];
            [[@(str.length) should] beGreaterThan:@(0)];

            NSString* path = [PodAsset pathForFilename:@"test.json" pod:@"TestPod"];
            NSLog(@"resource path: %@", path);
            [[@(path.length) should] beGreaterThan:@(0)];

            // PodAsset_Example.app contains TestPod.bundle
            // so the values of array should be the content of PodAsset_Example.app
            NSArray* array = [PodAsset assetsInPod:@"TestPod"];
            // the actual content may vary
            //NSArray* expectedValueForArray = @[ @"PodAsset_Example",
                                                //@"PlugIns",
                                                //@"en.lproj",
                                                //@"_CodeSignature",
                                                //@"Frameworks",
                                                //@"Info.plist",
                                                //@"Main.storyboardc",
                                                //@"PkgInfo",
                                                //@"TestPod.bundle" ];
            
            [[@(array.count) should] beGreaterThan:@(0)];

            // FrameworkPod.framework contains FrameworkPod.bundle, 
            // so the values of array2 should be the content of FrameworkPod.framework
            NSArray* array2 = [PodAsset assetsInPod:@"FrameworkPod"];
            // the actual content may vary
            //NSArray* expectedValueForArray2 = @[ @"FrameworkPod",
                                                 //@"_CodeSignature",
                                                 //@"FrameworkPod.bundle",
                                                 //@"Info.plist"];
            [[@(array.count) should] beGreaterThan:@(0)];
            
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

