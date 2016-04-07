//
//  PodAsset.h
//  PodAsset
//
//  Created by Hai Feng Kao on 2016/04/06.
//
//

#import <Foundation/Foundation.h>

@interface PodAsset : NSObject
+ (NSString*)pathForFilename:(NSString*)filename pod:(NSString*)podName;
+ (NSData*)dataForFilename:(NSString*)filename pod:(NSString*)podName;
+ (NSString*)stringForFilename:(NSString*)filename pod:(NSString*)podName;
+ (NSArray*)assetsInPod:(NSString*)podName;
@end
