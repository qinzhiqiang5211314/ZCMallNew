//
//  MKRefresh.h
//  MK
//
//  Created by hgh on 16/6/13.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <Foundation/Foundation.h>

#define HRefreshViewMethodIOS7 ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0)
#define ZCRefreshObservingkeyWord @"contentOffset"
#define ZCNavigationBarDefaultHeight 64


//#define MKRefreshViewDefaultHeight 70.0f
//#define HActivityIndicatorViewMargin 50.0f
//#define HTextIndicatorMargin 20.0f
//#define HTimeIndicatorMargin 10.0f


//
///**
// *  进入刷新状态时的提示文字
// */
//#define HRefreshViewRefreshingStateText @"正在加载最新数据,请稍候"
//
///**
// *  进入即将刷新状态时的提示文字
// */
//#define HRefreshViewWillRefreshStateText @"松开即可加载最新数据"

typedef enum {
    
    ZCRefreshState_WillRefresh,
    ZCRefreshState_Refreshing,
    ZCRefreshState_Normal
    
} ZCRefreshState;

