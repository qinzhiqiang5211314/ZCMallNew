//
//  MKRefreshProtocol.h
//  MK
//
//  Created by hgh on 16/6/13.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ZCRefreshProtocol <NSObject>

/**
 *  即将刷新
 */
-(void)setWillRefreshState;

/**
 *  刷新中
 */
-(void)setRefreshingState;

/**
 *  正常状态
 */
-(void)setNormalState;

@end
