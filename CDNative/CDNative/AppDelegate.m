//
//  AppDelegate.m
//  CDNative
//
//  Created by Yvan Feng on 2021/8/11.
//

#import "AppDelegate.h"
#import <FlutterBoost.h>
#import "CDFlutterBoost.h"

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
            //回调给Flutter侧
            result(@"回调-返回数据");
        }];
    }];
    return YES;
}




@end
