//
//  CDNetworkTool.m
//  CDNative
//
//  Created by Yvan Feng on 2021/8/30.
//

#import "CDNetworkTool.h"

@implementation CDNetworkTool

+ (instancetype)sharedInstance {
    static CDNetworkTool *_manager;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        _manager = [CDNetworkTool manager];
        _manager.requestSerializer.timeoutInterval = 20.f;
        _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/xml", @"text/plain", nil];
    });
    return _manager;
}

@end
