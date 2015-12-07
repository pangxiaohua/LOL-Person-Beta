//
//  AppDelegate.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"
#define AppKey @"5663c64f67e58e9c41002b71"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self initializeWithApplication:application];
    
    
   
    /**
     *  @param ReportPolicy 报告的频率，是一个枚举。官方解释：发送策略，默认值是:BATCH，即“启动发送”模式
     *  @retrun void
     */
    [MobClick startWithAppkey:AppKey reportPolicy:BATCH channelId:nil];
    
    
    return YES;
}

@end
