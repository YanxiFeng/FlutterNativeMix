//
//  AppDelegate.m
//  CDNative
//
//  Created by Yvan Feng on 2021/8/11.
//

#import "AppDelegate.h"
#import <FlutterBoost.h>
#import "CDFlutterBoost.h"
#import "CDNetworkTool.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    CDFlutterBoost *delegate = [CDFlutterBoost sharedBoostDelegate];
    [[FlutterBoost instance] setup:application delegate:delegate callback:^(FlutterEngine *engine){
        FlutterMethodChannel *channel = [FlutterMethodChannel methodChannelWithName:@"chope_flutter_method_channel" binaryMessenger:engine.binaryMessenger];
        [channel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
            //Flutter侧发送过来的数据
            NSLog(@"FlutterMethodCall ===> %@", call.method);
            
            [[CDNetworkTool sharedInstance] GET:@"http://rap2api.chope.cc/app/mock/17/restaurants/list/yongtest" parameters:@{} headers:@{} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                //回调给Flutter侧
                result(responseObject[@"return"][@"dish_module"][@"title"]);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
            }];
            
        }];
    }];
    return YES;
}




@end
