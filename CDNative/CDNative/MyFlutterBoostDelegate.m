//
//  MyFlutterBoostDelegate.m
//  CDNative
//
//  Created by Yvan Feng on 2021/8/12.
//

#import "MyFlutterBoostDelegate.h"
#import "BoostBaseViewController.h"

@implementation MyFlutterBoostDelegate

/// 如果框架发现您输入的路由表在flutter里面注册的路由表中找不到，那么就会调用此方法来push一个纯原生页面
- (void)pushNativeRoute:(NSString *)pageName arguments:(NSDictionary *)arguments{
    
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
    static MyFlutterBoostDelegate *instance;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        if (!instance) {
            instance = [[MyFlutterBoostDelegate alloc] init];
        }
    });
    return instance;
}

@end
