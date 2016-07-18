//
//  MKTableFoot.h
//  MK
//
//  Created by hgh on 16/6/12.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ZCRefreshProtocol.h"

@protocol ZCTableFoot <NSObject>

/**
 *  底部刷新
 */
@property(nonatomic,strong)UIView<ZCRefreshProtocol>*        mRefreshFooter;

/**
 *  注入scrollview
 *
 *  @param _scrollview 实例
 */
-(void) plugScrollview:(UIScrollView*)_scrollview;

/**
 *  加载更多
 */
@property(nonatomic,copy)void(^loadMoreBlock)(void);

/**
 *  停止刷新
 */
-(void)stopRefresh;

@end


