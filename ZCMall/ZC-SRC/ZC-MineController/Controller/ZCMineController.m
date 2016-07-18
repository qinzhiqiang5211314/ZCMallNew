//
//  ZCMineController.m
//  ZCMall
//
//  Created by hgh on 16/7/16.
//  Copyright © 2016年 FHHY. All rights reserved.
//

#import "ZCMineController.h"
#import "ZCMineView.h"
#import "ZCMineServer.h"
#import "ZCLoginController.h"
#import "ZCRegisterController.h"
#import "FeedbackViewController.h"
#import "PlayHistoryViewController.h"
#import "ShippingAddressController.h"
@interface ZCMineController()
{
    
    ZCMineView*                     mView;
    ZCMineServer*                   mServer;
    
}

@end

@implementation ZCMineController

-(ZCMineServer*)mServer
{
    if (mServer==nil) {
        mServer = [[ZCMineServer alloc] init];
        
    }
    return mServer;
}

-(ZCMineView*)mView
{
    if (mView==nil) {
        mView = [[ZCMineView alloc] initWithFrame:CGRectMake(0, 0, APPWIDTH, APPHEIGHT-APP_NaviH)];
        [mView showBlock:^(NSString* sender){
            if ([sender isEqualToString:@"登录"]) {
                ZCLoginController *zcLoginVc =[[ZCLoginController alloc]init];
                [self.navigationController pushViewController:zcLoginVc animated:YES];
            }else if ([sender isEqualToString:@"注册"]){
                ZCRegisterController *zcRegisterVc =[[ZCRegisterController alloc]init];
                [self.navigationController pushViewController:zcRegisterVc animated:YES];
            }else if ([sender isEqualToString:@"意见反馈"]){
                FeedbackViewController *feedBackVc =[[FeedbackViewController alloc]init];
                [self.navigationController pushViewController:feedBackVc animated:YES];
            }else if ([sender isEqualToString:@"播放历史"]){
                PlayHistoryViewController *playVc =[[PlayHistoryViewController alloc]init];
                [self.navigationController pushViewController:playVc animated:YES];
            }else if ([sender isEqualToString:@"收货地址"]){
                ShippingAddressController *shippingVc =[[ShippingAddressController alloc]init];
                [self.navigationController pushViewController:shippingVc animated:YES];
            }
        
        
        }];
    }
    
    return mView;
}

-(void) loadHeaderView
{
    [self.mNavgationBar hiden:YES];
}

-(void) viewDidLoad
{
    [super viewDidLoad];
    
    /**
     *  添加导航栏
     */
    [self loadHeaderView];
    
    /**
     *  添加view 层
     */
    [self.view addSubview:[self mView]];
    
    /**
     *  数据请求
     */
    [self mServer];
    
}


@end
