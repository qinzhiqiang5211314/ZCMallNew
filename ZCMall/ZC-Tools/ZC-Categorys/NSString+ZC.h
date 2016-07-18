//
//  NSString+ZC.h
//  ZCMall
//
//  Created by hgh on 16/7/16.
//  Copyright © 2016年 FHHY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ZC)

/**
 *  返回字符串所占用的尺寸
 *
 *  @param font    字体
 *  @param maxSize 最大尺寸
 */
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

+ (NSString *)firstCharactor:(NSString *)aString;
/**
 *  @Author licheng, 15-01-21 16:01:45
 *
 *  TODO:将字符串首尾的空格去除
 */
- (NSString *)stringByTrimmingInvalidCharacter;


@end
