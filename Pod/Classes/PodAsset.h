//
//  PodAsset.h
//  PodAsset
//
//  Created by Hai Feng Kao on 2016/04/06.
//
//

#import <Foundation/Foundation.h>

@interface PodAsset : NSObject
+ (nullable NSURL*)urlForFilename:(nonnull NSString*)filename pod:(nonnull NSString*)podName;
+ (nullable NSString*)pathForFilename:(nonnull NSString*)filename pod:(nonnull NSString*)podName;
+ (nullable NSData*)dataForFilename:(nonnull NSString*)filename pod:(nonnull NSString*)podName;
+ (nullable NSString*)stringForFilename:(nonnull NSString*)filename pod:(nonnull NSString*)podName;

// returns the resource bundle path for the specified pod  
+ (nullable NSString*)bundlePathForPod:(nonnull NSString*)podName;

// return the resource bundle
+ (nullable NSBundle*)bundleForPod:(nonnull NSString*)podName;

// returns all assets in the bundle that contains the specified pod 
+ (nullable NSArray*)assetsInPod:(nonnull NSString*)podName;
@end
