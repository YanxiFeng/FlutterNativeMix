//
//  ViewController.m
//  CDNative
//
//  Created by Yvan Feng on 2021/8/11.
//

#import "ViewController.h"
#import <FlutterBoost.h>
#import "BoostBaseViewController.h"
#import "MyFlutterBoostDelegate.h"

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
    [MyFlutterBoostDelegate sharedBoostDelegate].navigationController = self.navigationController;
    [[MyFlutterBoostDelegate sharedBoostDelegate] pushFlutterRoute:options];
    
}


@end
