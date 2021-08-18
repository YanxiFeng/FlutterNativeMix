//
//  BoostBaseViewController.m
//  CDNative
//
//  Created by Yvan Feng on 2021/8/14.
//

#import "BoostBaseViewController.h"

@interface BoostBaseViewController ()

@end

@implementation BoostBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}


@end
