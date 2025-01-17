//
//  CDHomeViewController.m
//  CDNative
//
//  Created by Yvan Feng on 2021/8/25.
//

#import "CDHomeViewController.h"
#import <FlutterBoost.h>
#import "BoostBaseViewController.h"
#import "CDFlutterBoost.h"

@interface CDHomeViewController ()

@property (copy, nonatomic) FBVoidCallback removeListener;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;

@end

@implementation CDHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.navigationItem.title = @"首页 Native";
    
    //接收Flutter事件
    self.removeListener = [[FlutterBoost instance] addEventListener:^(NSString *name, NSDictionary *arguments) {
        NSLog(@"========= %@ - %@",name,arguments);
        self.messageLabel.text = arguments[@"name"];
    } forName:@"FlutterEventToNative"];
}


- (IBAction)routeFlutterHomeView:(UIButton *)sender {
    
    FlutterBoostRouteOptions *options = [FlutterBoostRouteOptions new];
    options.pageName = @"home";
    [CDFlutterBoost sharedBoostDelegate].navigationController = self.navigationController;
    [[CDFlutterBoost sharedBoostDelegate] pushFlutterRoute:options];
    
}

- (IBAction)routeFlutterSelectCity:(UIButton *)sender {
    FlutterBoostRouteOptions *options = [FlutterBoostRouteOptions new];
    options.pageName = @"select_city";
    [CDFlutterBoost sharedBoostDelegate].navigationController = self.navigationController;
    [[CDFlutterBoost sharedBoostDelegate] pushFlutterRoute:options];
}

@end
