//
//  MKTableViewCfg.h
//  MK
//
//  Created by hgh on 16/6/14.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol ZCTabBarViewCfg <NSObject>

/**
 *  返回所有控制器
 *
 *  @return 控制器列表
 */
-(NSMutableArray*) controllers;

/**
 *  设施tabbar样式
 */
-(void) setTabBarStyle;

/**
 *  其他设置
 */
-(void) otherSeting;

@end
