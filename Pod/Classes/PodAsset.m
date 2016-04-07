//
//  PodAsset.m
//  PodAsset
//
//  Created by Hai Feng Kao on 2016/04/06.
//
//

#import "PodAsset.h"

@implementation PodAsset

+ (NSString*)pathForFilename:(NSString*)filename pod:(NSString*)podName
{
    NSString* bundlePath  = [self bundlePathForPod:podName];
    if (!bundlePath) { return nil; } 

    NSBundle* bundle = [NSBundle bundleWithPath:bundlePath];
    NSString* extension = [filename pathExtension];
    NSString* withoutExtension = [[filename lastPathComponent] stringByDeletingPathExtension];
    NSString* path = [bundle pathForResource:withoutExtension ofType:extension];

    return path;
}

+ (NSString*)stringForFilename:(NSString*)filename pod:(NSString*)podName
{
    NSString* bundlePath  = [self bundlePathForPod:podName];
    if (!bundlePath) { return nil; } 

    NSBundle* bundle = [NSBundle bundleWithPath:bundlePath];
    NSString* extension = [filename pathExtension];
    NSString* withoutExtension = [[filename lastPathComponent] stringByDeletingPathExtension];
    NSString* path = [bundle pathForResource:withoutExtension ofType:extension];

    return [NSString stringWithContentsOfFile:path
                                     encoding:NSUTF8StringEncoding
                                        error:nil];
}

+ (NSData*)dataForFilename:(NSString*)filename pod:(NSString*)podName
{
    NSString* bundlePath  = [self bundlePathForPod:podName];
    if (!bundlePath) { return nil; } 

    NSBundle* bundle = [NSBundle bundleWithPath:bundlePath];
    NSString* extension = [filename pathExtension];
    NSString* withoutExtension = [[filename lastPathComponent] stringByDeletingPathExtension];
    NSString* path = [bundle pathForResource:withoutExtension ofType:extension];

    return [NSData dataWithContentsOfFile:path options:0 error:nil];
}

+ (NSArray*)assetsInPod:(NSString*)podName
{
    NSBundle* bundle  = [self bundleForPod:podName];
    if (!bundle) { return nil; } 

    NSString *bundleRoot = [bundle bundlePath];
    NSArray *paths = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:bundleRoot error:nil];
    return paths;
    //for (NSString *filePath in paths)
    //{
        //NSString *fileName = [filePath lastPathComponent];
        //NSLog(@"%@", fileName);
    //}
}

#pragma mark - private
+ (NSString*)bundlePathForPod:(NSString*)podName
{
    // search all bundles
    for (NSBundle* bundle in [NSBundle allBundles]) {
        NSString* bundlePath = [bundle pathForResource:podName ofType:@"bundle"];
        if (bundlePath) { return bundlePath; }
    }

    // some pods do not use "resource_bundles"
    // please check the pod's podspec
    return nil;
}

+ (NSBundle*)bundleForPod:(NSString*)podName
{
    // search all bundles
    for (NSBundle* bundle in [NSBundle allBundles]) {
        NSString* bundlePath = [bundle pathForResource:podName ofType:@"bundle"];
        if (bundlePath) { return bundle; }
    }

    // some pods do not use "resource_bundles"
    // please check the pod's podspec
    return nil;
}
@end
