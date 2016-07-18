//
//  ZCShopingServer.h
//  ZCMall
//
//  Created by hgh on 16/7/16.
//  Copyright © 2016年 FHHY. All rights reserved.
//

#import "ZCBaseService.h"

@protocol ZCShopingServerDelegate <NSObject>

/**
 *  数据请求成功回调
 *
 *  @param _it 数据列表
 */
-(void) uiDataGetSucced:(id)_it;

/**
 *  数据请求失败
 *
 *  @param _error 失败原因
 */
-(void) uiDAtaGetFailed:(NSString*)_error;

@end

@interface ZCShopingServer : ZCBaseService
{
    
}

@property(nonatomic,assign)id<ZCShopingServerDelegate>  mDelegate;

/**
 *  获取界面数据
 */
-(void) uiDataGet;

@end
