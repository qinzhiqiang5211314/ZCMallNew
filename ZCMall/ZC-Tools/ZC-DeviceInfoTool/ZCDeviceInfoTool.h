//
//  MKDeviceInfoTool.h
//  MK
//
//  Created by 李诚 on 16/6/14.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZCDeviceInfoTool : NSObject

/*
 * 函数作用: 获取uuid
 * 函数参数:
 * 函数返回值: uuid
 */
+(NSString *)getDeviceUUID;


/**
 *  @author MCMac
 *
 *  保存Devecetoken
 */

+(void)saveDevecetoken:(NSData *)token;


+(NSString *)getDevecetoken;


@end
