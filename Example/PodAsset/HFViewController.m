//
//  HFViewController.m
//  PodAsset
//
//  Created by Hai Feng Kao on 04/06/2016.
//  Copyright (c) 2016 Hai Feng Kao. All rights reserved.
//

#import "HFViewController.h"
#import "PodAsset.h"
#import "hello.h"
@interface HFViewController ()

@end

@implementation HFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString* bundlePath  = [[NSBundle bundleForClass:[self class]] pathForResource:@"TestPod" ofType:@"bundle"];
    NSString* frameworkPath  = [[NSBundle bundleForClass:[self class]] pathForResource:@"FrameworkPod" ofType:@"bundle"];
    hello* h = [hello new];
    NSString* frameworkPath2  = [[NSBundle bundleForClass:[h class]] pathForResource:@"FrameworkPod" ofType:@"bundle"];
    NSLog(@"bundlePath: %@", bundlePath);
    NSLog(@"frameworkPath: %@", frameworkPath);

    NSData* frameData = [PodAsset dataForFilename:@"test2.json" pod:@"FrameworkPod"];
    NSAssert(frameData, @"should get the data");

    NSData* data = [PodAsset dataForFilename:@"test.json" pod:@"TestPod"];
    NSAssert(data, @"should get the data");

    NSString* path = [PodAsset pathForFilename:@"test.json" pod:@"TestPod"];
    NSLog(@"resource path: %@", path);

    NSArray* array = [PodAsset assetsInPod:@"TestPod"];
    for (NSString* str in array) {
        NSLog(@"%@", str);
    }

    NSArray* array2 = [PodAsset assetsInPod:@"FrameworkPod"];
    for (NSString* str in array2) {
        NSLog(@"%@", str);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
