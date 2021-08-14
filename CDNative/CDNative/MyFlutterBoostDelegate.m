//
//  MyFlutterBoostDelegate.m
//  CDNative
//
//  Created by Yvan Feng on 2021/8/12.
//

#import "MyFlutterBoostDelegate.h"
#import "BoostBaseViewController.h"

@implementation MyFlutterBoostDelegate


///如果框架发现您输入的路由表在flutter里面注册的路由表中找不到，那么就会调用此方法来push一个纯原生页面
- (void)pushNativeRoute:(NSString *) pageName arguments:(NSDictionary *) arguments{
    
}

///当框架的withContainer为true的时候，会调用此方法来做原生的push
- (void)pushFlutterRoute:(FlutterBoostRouteOptions *)options {
    
    self.options = options;
    
    BoostBaseViewController *vc = BoostBaseViewController.new;
    vc.hidesBottomBarWhenPushed = YES;
    [vc setName:options.pageName uniqueId:options.uniqueId params:options.arguments opaque:options.opaque];
    
    //默认
    BOOL animated = YES;
    BOOL present = NO;
    
    //特殊处理,为什么不会用present,因为生命周期有问题
//    if ([options.pageName isEqual:kChopeBalanceDialogRouteKey]) {
//        animated = NO;
//        vc.view.backgroundColor = RGBACOLOR(33, 33, 33, 0.48);
//    }
    
    if(present){
        [self.navigationController presentViewController:vc animated:animated completion:^{
        }];
    }else{
        [self.navigationController pushViewController:vc animated:animated];
    }
    
}

///当pop调用涉及到原生容器的时候，此方法将会被调用
- (void)popRoute:(FlutterBoostRouteOptions *)options {
       
    if (self.options.onPageFinished) {
        self.options.onPageFinished(options.arguments);
    }
    
    BoostBaseViewController *vc = (id)self.navigationController.presentedViewController;
    
    if([vc isKindOfClass:BoostBaseViewController.class]){
        [vc dismissViewControllerAnimated:YES completion:^{}];
    }else{
        
        BOOL animated = [options.pageName isEqual:@"ChopeDollarsBalanceListPage"];
        [self.navigationController popViewControllerAnimated:!animated];
    }
    
}


@end
