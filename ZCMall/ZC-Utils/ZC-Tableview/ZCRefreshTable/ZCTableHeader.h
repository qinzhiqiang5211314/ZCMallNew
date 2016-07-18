//
//  MKTableHeader.h
//  MK
//
//  Created by hgh on 16/6/12.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ZCRefreshProtocol.h"

@protocol MKTableHeader <NSObject>

/**
 *  刷新头
 */
@property(nonatomic,strong)UIView<ZCRefreshProtocol>*        mRefreshHeader;

/**
 *  注入scrollview
 *
 *  @param _scrollview 实例
 */
-(void) plugScrollview:(UIScrollView*)_scrollview;

/**
 *  刷新
 */
@property(nonatomic,copy)void(^refreshBlock)(void);


/**
 *  刷新结束
 */
@property(nonatomic,copy)void(^refreshEndBlock)(void);

/**
 *  强制刷新
 */
-(void)forceRefresh;

/**
 *  停止刷新
 */
-(void)stopRefresh;



@end
