//
//  ZCHomepageController.m
//  ZCMall
//
//  Created by hgh on 16/7/16.
//  Copyright © 2016年 FHHY. All rights reserved.
//

#import "ZCHomepageController.h"
#import "ZCHomepageView.h"
#import "ZCHomepageServer.h"

@interface ZCHomepageController()
{
    ZCHomepageView*                 mView;
    ZCHomepageServer*               mServer;
}

@end

@implementation ZCHomepageController

-(ZCHomepageServer*)mServer
{
    if (mServer==nil) {
        mServer = [[ZCHomepageServer alloc] init];
        
    }
    return mServer;
}

-(ZCHomepageView*)mView
{
    if (mView==nil) {
        mView = [[ZCHomepageView alloc] initWithFrame:CGRectMake(0, APP_NaviH, APPWIDTH, APPHEIGHT-APP_NaviH)];
    }
    
    return mView;
}


-(void) loadHeaderView
{
    [self.mNavgationBar setMTitleStr:@"首页"];
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
