//
//  MKAbnormalShowProtocal.h
//  MK
//
//  Created by hgh on 16/6/15.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ZCAbnormalShowProtocal <NSObject>

/**
 *  刷新页面回调
 */
@property(nonatomic,copy)void(^ReloadBlock)(void);

/**
 *  暂无数据
 */
-(void) noData;

/**
 *  网络不佳，请刷新页面
 */
-(void) noNetPleaseReload;

/**
 *  敬请期待
 */
-(void) pleaseLookForward;

@end
