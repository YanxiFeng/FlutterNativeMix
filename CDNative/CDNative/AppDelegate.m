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
        
    }];
    return YES;
}




@end
