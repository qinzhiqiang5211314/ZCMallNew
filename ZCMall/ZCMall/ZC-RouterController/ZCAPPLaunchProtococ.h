//
//  MKAPPLaunchProtococ.h
//  MK
//
//  Created by 李和平 on 16/6/22.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ZCAPPLaunchProtococ <NSObject>

/**
 *  app是否首次启动
 *
 *  @return 【yes/no】对应【首次启动/不是首次启动】
 */
-(BOOL) appFirstLaunch;

/**
 *  设置启动成功
 */
-(void) launched;

/**
 *  是否启动赛事页面
 *
 *  @return 【yes/no】对应【启动/不启动】
 */
-(BOOL) matchShow;

/**
 *  获取app信息
 */
-(void) appInformGet;

@end
