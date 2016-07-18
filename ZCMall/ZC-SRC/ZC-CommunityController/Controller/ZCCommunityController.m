//
//  ZCCommunityController.m
//  ZCMall
//
//  Created by hgh on 16/7/16.
//  Copyright © 2016年 FHHY. All rights reserved.
//

#import "ZCCommunityController.h"
#import "ZCHomepageServer.h"
#import "ZCHomepageView.h"

@interface ZCCommunityController()
{
    ZCHomepageView*                 mView;
    ZCHomepageServer*               mServer;
}

@end

@implementation ZCCommunityController

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
    [self.mNavgationBar setMTitleStr:@"社区"];
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
