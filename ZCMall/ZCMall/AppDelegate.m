//
//  AppDelegate.m
//  ZCMall
//
//  Created by hgh on 16/7/15.
//  Copyright © 2016年 FHHY. All rights reserved.
//

#import "AppDelegate.h"
#import "ZCLocationServer.h"
#import "ZCServerFactory.h"
#import "Reachability.h"
#import "ZCLocationServerTool.h"
#import "ZCIMServerCfg.h"
#import "ZCControllerRouterFactory.h"

@interface AppDelegate ()
{
    Reachability*           mCurrentRechbility;
}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    /**
     *  启动定位系统
     */
   // [[ZCLocationServerTool locationServer] startLocation];
    
    
    
    /**
     *  注册推送
     */
    //    [[MKPushFactory  shareDefault] registerPushWithUIApplication:application launchOptions:launchOptions];
    
    
    /**
     *  服务器配置
     *  MKServerEnvironment_Develop, //开发环境
     *  MKServerEnvironment_Test, //测试环境 r
     *  MKServerEnvironment_PreRelease, //预发布环境20
     *  MKServerEnvironment_HotFix, //appstore 发布环境
     */
    [[ZCServerFactory shareDefault] setServer:[[ZCIMServerCfg alloc] init]];
    [[ZCServerFactory shareDefault] setServerEnvironment:MKServerEnvironment_Develop];
    
    
    
    /**
     *  app网络监测
     */
    // 获得Reachability对象
   // mCurrentRechbility = [Reachability reachabilityForInternetConnection];
    // 开始监控网络
   // [mCurrentRechbility startNotifier];
    //网络状态回调
   // [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkStateChange) name:kReachabilityChangedNotification object:nil];
    
    
    /**
     *  初始化三方（qq、wx）登录/分享
     */
    
    /**
     初始化视口
     
     - returns:
     */
    self.window = [[[ZCControllerRouterFactory shareDefault] router] didFinishLaunchingWithOptions];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
