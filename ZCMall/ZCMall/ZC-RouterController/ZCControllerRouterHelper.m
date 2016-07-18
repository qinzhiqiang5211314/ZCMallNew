//
//  MKControllerRouterHelper.m
//  MK
//
//  Created by 李和平 on 16/6/22.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCControllerRouterHelper.h"
#import "ZCAPPLoginFactory.h"
#import "ZCUITabBarWithStyle_s.h"
#import "ZCLoginController.h"
#import "ZCUINavigationController.h"
#import "ZCAppGuidePage.h"
#import "ZCAPPLaunchProtococ.h"
#import "ZCMatchPageView.h"
#import "ZCAppUserFactory.h"
//#import "ZCServerFactory.h"
#import "ZCAPPLaunchProtococ.H"

@interface ZCControllerRouterHelper ()<ZCMatchPageViewDelegate>
{
    UIWindow*                   mWindow;
    
    BOOL                        mIsJumpMatchPage;
}

@property(nonatomic,strong)NSObject<ZCAPPLaunchProtococ>*               mLaunch;

@end


@implementation ZCControllerRouterHelper
@synthesize mLaunch;

-(id) init
{
    self = [super init];
    if (self) {
        if ([self conformsToProtocol:@protocol(ZCAPPLaunchProtococ)]) {
            self.mLaunch = (NSObject<ZCAPPLaunchProtococ>*)self;
            
        }
        
        mIsJumpMatchPage = NO;
    }
    
    return self;
}



/**
 *  启动应用
 *
 *  @return 视图
 */
-(UIWindow*) didFinishLaunchingWithOptions
{
    /**
     *  登录成功回调
     *
     *  @param AppLoginSucced: 登录成功回调函数
     *
     *  @return nil
     */
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(AppLoginSucced:)
                                                 name:NSNotification_LoginSucced object:nil];
    
    /**
     *  退出登录通知
     *
     *  @param AppLoginoutSucced: 退出登录成功
     *
     *  @return nil
     */
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(AppLoginoutSucced:)
                                                 name:NSNotification_LoginoutSucced object:nil];
    
    /**
     异常登录通知
     
     - returns: nil
     */
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(logInAbnormalAction:)
                                                 name:NSNotification_LoginAbnormal object:nil];
  
    
    //
    mWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    mWindow.backgroundColor = [UIColor whiteColor];
    mWindow.rootViewController = [self currentController];
    [mWindow makeKeyAndVisible];
    
    //其他操作
    [self otherOperation];
    
    return mWindow;

}

-(UIViewController*) currentController
{
    
    return [[ZCUITabBarWithStyle_s alloc] init];
    //判断是否是第一次启动
    if ([self.mLaunch appFirstLaunch]) {
        //弹出登录页面
        return [[ZCUINavigationController alloc] initWithRootViewController:[[ZCLoginController alloc] init]];
        
    }else
    {
        //判断是否已经登录
        if ([[[ZCAPPLoginFactory shareDefault] appLogin] isLogin]) {
            //已经登录
            //登录im
            return [[ZCUITabBarWithStyle_s alloc] init];
            
        }else
        {
            //弹出登录页面
            return [[ZCUINavigationController alloc] initWithRootViewController:[[ZCLoginController alloc] init]];
            
        }
        
    }
    
}

-(void) otherOperation
{
    //
    //判断是否是第一次启动

    if ([self.mLaunch appFirstLaunch]) {
        //添加引导页
        ZCAppGuidePage*_guidepage = [[ZCAppGuidePage alloc] initWithFrame:CGRectMake(0, 0, APPSIZE.width, APPSIZE.height)];
        [mWindow.rootViewController.view addSubview:_guidepage];
        
        [self.mLaunch launched];
        
    }else
    {
        //判断是否添加赛事页面
        if ([self.mLaunch matchShow]) {
            //添加赛事页面
            ZCMatchPageView*_matchpage = [[ZCMatchPageView alloc] initWithFrame:CGRectMake(0, 0, APPSIZE.width, APPSIZE.height)];
            _matchpage.mDelegate = self;
            [mWindow.rootViewController.view addSubview:_matchpage];

            
        }
        
    }
}

-(void)AppLoginSucced:(id)_it
{
    //
    if (mWindow) {
        mWindow.rootViewController = [[ZCUITabBarWithStyle_s alloc] init];
        
        if (mIsJumpMatchPage) {
            //跳转到对应的赛事页面
            //[];
        }
    }
}


-(void)AppLoginoutSucced:(id)_it
{
    
    //清理数据
    [self clearUserData];
    
    //弹出登录页面
    if (mWindow) {
        UIViewController* _ct = mWindow.rootViewController;
        mWindow.rootViewController = [[ZCUINavigationController alloc] initWithRootViewController:[[ZCLoginController alloc] init]];
        _ct.view = nil;
        _ct = nil;
    }
    
}

-(void)logInAbnormalAction:(id)_it
{
    //弹出登录页面
    if (mWindow) {
        UIViewController* _ct = mWindow.rootViewController;
        mWindow.rootViewController = [[ZCUINavigationController alloc] initWithRootViewController:[[ZCLoginController alloc] init]];
        _ct.view = nil;
        _ct = nil;
    }

}

-(void) clearUserData
{
    //清理用户数据
    [[[ZCAppUserFactory shareDefault] user] clears];
    
    //清理rArchive
    [[[ZCAppUserFactory shareDefault] user] clearArchive];
    
    //清理jsessionId
    //[[NSUserDefaults standardUserDefaults] setObject:@"" forKey:NSUserDefaults_Gps_wdcli];
    
    //清理本地用户信息

    
//    //清除沙盒用户名密码
//    [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:LOGIN_PASSWORD];
//    [[NSUserDefaults standardUserDefaults] synchronize];

    
//    //清除
//    NSString *filePath = [__PATH_CACHE__ stringByAppendingPathComponent:@"sendfield.plist"];
//    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
//        [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
//    }


}


//#pragma mark------------------------------MKMatchPageViewDelegate-----------------------------

//我要参加按钮
- (void)adLaunchViewDidSelectEnterButton:(ZCMatchPageView *)view
{
    //判断是否已经登录
    if ([[[ZCAPPLoginFactory shareDefault] appLogin] isLogin]) {
        //已经登录跳转到对应的页面
        
        return;
    }
    
    //如果没有登录，登录成功之后做跳转
    mIsJumpMatchPage = YES;
    

}

//跳过按钮
- (void)adLaunchViewDidSelectSkipButton:(ZCMatchPageView *)view
{
    [UIView animateWithDuration:1.0 animations:^{
        view.alpha = 0.0;
        view.transform = CGAffineTransformMakeScale(1.5, 1.5);
    } completion:^(BOOL finished) {
        [view removeFromSuperview];
        
        
        
    }];

}



@end
