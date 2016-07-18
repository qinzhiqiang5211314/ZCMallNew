//
//  MKRefreshView.h
//  MK
//
//  Created by hgh on 16/6/13.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZCRefresh.h"


@interface ZCRefreshView : UIView
{
    
}

@property(nonatomic,copy)void(^refreshBlock)(void);

/**
 *  设置刷新状态
 */
- (BOOL)setRefreshState:(ZCRefreshState)_state;

/**
 *  返回当前刷新状态
 */
- (ZCRefreshState) currentState;

/**
 *  scrollView添加刷新属性
 */
- (void)setScrollView:(UIScrollView *)scrollView;

/**
 *  设置手动/强制刷新状态
 */
-(void)setManualRefresh:(BOOL)_ye;

/**
 *  返回强制刷新状态
 */
-(BOOL)isManuaRefresh;

/**
 *  结束刷新
 */
- (void)endRefreshing;

//
-(void)SetScrollViewEdgeInsets:(UIEdgeInsets)_value;

/**
 *  原始位置
 */
-(UIEdgeInsets)originalEdgeInsets;



@end
