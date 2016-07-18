//
//  ZCClassifyController.m
//  ZCMall
//
//  Created by hgh on 16/7/16.
//  Copyright © 2016年 FHHY. All rights reserved.
//

#import "ZCClassifyController.h"
#import "ZCClassifyView.h"
#import "ZCClassifyServer.h"


@interface ZCClassifyController()
{
    ZCClassifyView*             mView;
    ZCClassifyServer*           mServer;
}

@end


@implementation ZCClassifyController

-(ZCClassifyServer*)mServer
{
    if (mServer==nil) {
        mServer = [[ZCClassifyServer alloc] init];
        
    }
    return mServer;
}

-(ZCClassifyView*)mView
{
    if (mView==nil) {
        mView = [[ZCClassifyView alloc] initWithFrame:CGRectMake(0, APP_NaviH, APPWIDTH, APPHEIGHT-APP_NaviH)];
    }
    
    return mView;
}


-(void) loadHeaderView
{
    [self.mNavgationBar setMTitleStr:@"分类"];
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
