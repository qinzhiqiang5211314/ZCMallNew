//
//  MKGZIP.h
//  MK
//
//  Created by hgh on 16/6/11.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ZCGZIP <NSObject>

/**
 *  压缩字符串
 *
 *  @param _str 待压缩的字符串
 *
 *  @return 压缩后的字符串
 */
-(NSString*)zip:(NSString*)_str;

/**
 *  解压字符串
 *
 *  @param _str 待解压的字符串
 *
 *  @return 解压后的字符串
 */
-(NSString*)unZip:(NSString*)_str;

@end
