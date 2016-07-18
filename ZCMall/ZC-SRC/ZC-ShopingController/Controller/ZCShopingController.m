//
//  ZCShopingController.m
//  ZCMall
//
//  Created by hgh on 16/7/16.
//  Copyright © 2016年 FHHY. All rights reserved.
//

#import "ZCShopingController.h"
#import "ZCShopingView.h"
#import "ZCShopingServer.h"
#import "ZCShopingSelectBar.h"

#define ZCShoping_SelectBar_hight 44

@interface ZCShopingController()<ZCShopingViewDelegate,ZCShopingServerDelegate,ZCShopingSelectBarDelegate>
{
    ZCShopingView*                  mView;
    ZCShopingServer*                mServer;
    
    //
    ZCShopingSelectBar*             mSelectBar;
}

@end

@implementation ZCShopingController

-(ZCShopingSelectBar*)mSelectBar
{
    if (mSelectBar==nil) {
        mSelectBar = [[ZCShopingSelectBar alloc]initWithFrame:CGRectMake(0, APPHEIGHT-ZCShoping_SelectBar_hight-APP_TabBarH, APPWIDTH, ZCShoping_SelectBar_hight)];
        mSelectBar.mDelegate = self;
    }
    
    return mSelectBar;
}

-(ZCShopingServer*)mServer
{
    if (mServer==nil) {
        mServer = [[ZCShopingServer alloc] init];
        mServer.mDelegate = self;
        
    }
    return mServer;
}

-(ZCShopingView*)mView
{
    if (mView==nil) {
        mView = [[ZCShopingView alloc] initWithFrame:CGRectMake(0, APP_NaviH, APPWIDTH, APPHEIGHT-APP_NaviH-APP_TabBarH-ZCShoping_SelectBar_hight) WithRefreshHeader:YES WithRefreshFooter:NO];
        mView.mDelegate = self;
        
        __weak typeof(self) _weakself = self;
        mView.refreshBlock = ^(void){
            
            [_weakself ZC_showLoadProgressWithTitle:@"加载中...."];
            [[_weakself mServer] uiDataGet];
        
        };
    }
    
    return mView;
}


-(void) loadHeaderView
{
    [self.mNavgationBar setMTitleStr:@"购物车"];
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
     *  添加底部选择bar
     */
    //[self.view addSubview:[self mSelectBar]];
    
    
    /**
     *  数据请求
     */
    [self ZC_showLoadProgressWithTitle:@"加载中....."];
    [[self mServer] uiDataGet];


}

#pragma mark-------------------------------ZCShopingServerDelegate---------------------------

/**
 *  全选
 */
-(void) selectAllAction
{
    
}

/**
 *  取消选择
 */
-(void) cancelSelectAction
{
    
}

/**
 *  去结算
 */
-(void) gotoPay
{
    
}



#pragma mark-------------------------------ZCShopingServerDelegate---------------------------

/**
 *  数据请求成功回调
 *
 *  @param _it 数据列表
 */
-(void) uiDataGetSucced:(id)_it
{
    [self ZC_showSuccessProgressWithTitle:@"成功" hideAfterDealy:.7];
    [self mView].mDataSource = _it;
    
    if (mSelectBar==nil) {
        [self.view addSubview:[self mSelectBar]];
    }
}

/**
 *  数据请求失败
 *
 *  @param _error 失败原因
 */
-(void) uiDAtaGetFailed:(NSString*)_error
{
    [self ZC_showErrorProgressWithTitle:_error hideAfterDealy:.7];
}



#pragma mark-------------------------------ZCShopingViewDelegate---------------------------
/**
 *  进入旗舰店
 *
 *  @param _it 地铺信息
 */
-(void) gotoShops:(id)_it
{
    //进入二级页面
    
    
}

@end
