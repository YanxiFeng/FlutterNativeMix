//
//  MyFlutterBoostDelegate.h
//  CDNative
//
//  Created by Yvan Feng on 2021/8/12.
//

#import <Foundation/Foundation.h>
#import <FlutterBoost.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyFlutterBoostDelegate : NSObject<FlutterBoostDelegate>
@property (nonatomic,strong) UINavigationController *navigationController;
@property (nonatomic,strong) FlutterBoostRouteOptions *options;
@end

NS_ASSUME_NONNULL_END
