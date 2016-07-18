//
//  MKLocationServer.h
//  MK
//
//  Created by 李和平 on 16/6/24.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol ZCLocationServerDelegate <NSObject>
@optional
/**
 *在将要启动定位时，会调用此函数
 */
- (void)willStartLocatingUser;

/**
 *在停止定位后，会调用此函数
 */
- (void)didStopLocatingUser;

/**
 *用户方向更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateUserHeading:(id)userLocation;

/**
 *用户位置更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateBMKUserLocation:(id)userLocation;

/**
 *定位失败后，会调用此函数
 *@param error 错误号
 */
- (void)didFailToLocateUserWithError:(NSError *)error;

@end


@protocol ZCLocationServer <NSObject>

/**
 *  定位回调处理
 */
@property(nonatomic,assign)id<ZCLocationServerDelegate>             mDelegate;


/**
 *  刷新一次定位
 */
-(void) refreshLocation;

/**
 *  开始定位
 */
-(void) startLocation;

/**
 *  停止定位
 */
-(void) stopLocation;

/**
 *  返回系统定位设置是否已打开
 *
 *  @return 【NO/Yes】对应【未开启/开启】
 */
-(BOOL) authorizationStatus;

/**
 *  当前是否处于定位状态
 *
 *  @return 【NO/Yes】对应【未开始定位/定位中】
 */
-(BOOL) locing;






@end
