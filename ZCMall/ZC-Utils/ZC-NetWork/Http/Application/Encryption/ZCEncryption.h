//
//  MKEncryption.h
//  MK
//
//  Created by hgh on 16/6/11.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ZCEncryption <NSObject>

/**
 *  数据加密
 *
 *  @param _str 需要加密的字符串
 *
 *  @return 加密后的字符串
 */
-(NSString*)encryption:(NSString*)_str;

/**
 *  数据解密
 *
 *  @param _str 需要解密的字符串
 *
 *  @return 解密后的字符串
 */
-(NSString*)decrypt:(NSString*)_str;

@end
