//
//  MyFlutterBoostDelegate.m
//  CDNative
//
//  Created by Yvan Feng on 2021/8/12.
//

#import "CDFlutterBoost.h"
#import "BoostBaseViewController.h"
#import "CDProfileViewController.h"

@implementation CDFlutterBoost

/// Flutter push 原生页面
- (void)pushNativeRoute:(NSString *)pageName arguments:(NSDictionary *)arguments{
    if ([pageName isEqualToString:@"ProfileViewController"]) {
        CDProfileViewController *profileVC = [[CDProfileViewController alloc] init];
        [self.navigationController pushViewController:profileVC animated:YES];
    }
}

/// 当框架的withContainer为true的时候，会调用此方法来做原生的push
- (void)pushFlutterRoute:(FlutterBoostRouteOptions *)options {
    
    self.options = options;
    
    BoostBaseViewController *boostVC = [[BoostBaseViewController alloc] init];
    [boostVC setName:options.pageName uniqueId:options.uniqueId params:options.arguments opaque:options.opaque];
    [self.navigationController pushViewController:boostVC animated:YES];
}

/// 当pop调用涉及到原生容器的时候，此方法将会被调用
- (void)popRoute:(FlutterBoostRouteOptions *)options {
       
    if (self.options.onPageFinished) {
        self.options.onPageFinished(options.arguments);
    }
    
    BoostBaseViewController *boostVC = (id)self.navigationController.presentedViewController;
    if([boostVC isKindOfClass:BoostBaseViewController.class]){
        [boostVC dismissViewControllerAnimated:YES completion:^{}];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

+ (instancetype)sharedBoostDelegate {
    static CDFlutterBoost *instance;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        if (!instance) {
            instance = [[CDFlutterBoost alloc] init];
        }
    });
    return instance;
}

@end
