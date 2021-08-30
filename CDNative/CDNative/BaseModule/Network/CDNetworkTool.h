//
//  CDNetworkTool.h
//  CDNative
//
//  Created by Yvan Feng on 2021/8/30.
//

#import <AFNetworking/AFNetworking.h>

NS_ASSUME_NONNULL_BEGIN

@interface CDNetworkTool : AFHTTPSessionManager

+ (instancetype)sharedInstance;

@end

NS_ASSUME_NONNULL_END
