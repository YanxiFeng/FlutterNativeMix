//
//  ViewController.m
//  CDNative
//
//  Created by Yvan Feng on 2021/8/11.
//

#import "ViewController.h"
#import <FlutterBoost.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)routeFlutterHomeView:(UIButton *)sender {
    FlutterBoostRouteOptions *options = [[FlutterBoostRouteOptions alloc] init];
    options.pageName = @"test";
    [[FlutterBoost instance] open:options];
}


@end
