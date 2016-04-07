//
//  HFViewController.m
//  PodAsset
//
//  Created by Hai Feng Kao on 04/06/2016.
//  Copyright (c) 2016 Hai Feng Kao. All rights reserved.
//

#import "HFViewController.h"
#import "PodAsset.h"
@interface HFViewController ()

@end

@implementation HFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString* bundlePath  = [[NSBundle bundleForClass:[self class]] pathForResource:@"TestPod" ofType:@"bundle"];
    NSString* bundlePath2  = [[NSBundle bundleForClass:[PodAsset class]] pathForResource:@"TestPod" ofType:@"bundle"];
    NSString* bundlePath3  = [[NSBundle bundleForClass:[NSObject class]] pathForResource:@"TestPod" ofType:@"bundle"];

    NSLog(@"bundlePath: %@", bundlePath);

    NSData* data = [PodAsset dataForFilename:@"test.json" pod:@"TestPod"];
    NSAssert(data, @"should get the data");

    NSString* path = [PodAsset pathForFilename:@"test.json" pod:@"TestPod"];
    NSLog(@"resource path: %@", path);

    NSArray* array = [PodAsset assetsInPod:@"TestPod"];
    for (NSString* str in array) {
        NSLog(@"%@", str);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
