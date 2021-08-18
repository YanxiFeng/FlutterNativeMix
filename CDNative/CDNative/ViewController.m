//
//  ViewController.m
//  CDNative
//
//  Created by Yvan Feng on 2021/8/11.
//

#import "ViewController.h"
#import <FlutterBoost.h>
#import "BoostBaseViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"首页 Native";
}

- (IBAction)routeFlutterHomeView:(UIButton *)sender {
//    FlutterBoostRouteOptions *options = [[FlutterBoostRouteOptions alloc] init];
//    options.pageName = @"test";
//    [[FlutterBoost instance] open:options];
    
    FlutterBoostRouteOptions *options = [FlutterBoostRouteOptions new];
    options.pageName = @"home";
    BoostBaseViewController *vc = BoostBaseViewController.new;
    vc.hidesBottomBarWhenPushed = YES;
    [vc setName:options.pageName uniqueId:options.uniqueId params:options.arguments opaque:options.opaque];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:vc];
    navigationController.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:navigationController animated:YES completion:nil];
}


@end
