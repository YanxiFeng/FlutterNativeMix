//
//  CDProfileViewController.m
//  CDNative
//
//  Created by Yvan Feng on 2021/8/26.
//

#import "CDProfileViewController.h"
#import "CDFlutterBoost.h"

@interface CDProfileViewController ()

@end

@implementation CDProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"个人信息 Native";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupSubviews];
}

- (void)setupSubviews {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(100, 100, 180, 30);
    [btn setTitle:@"发送消息给Flutter" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(sendEventToFlutter:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)sendEventToFlutter:(id)sender {
    // 发送消息给Natvie
    [[FlutterBoost instance] sendEventToFlutterWith:@"NativeEventKey" arguments:@{@"msg":@"我是iOS来的"}];
}

@end
