//
//  MKCommonTool.h
//  MK
//
//  Created by hgh on 16/6/13.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCCommonTool : NSObject
/**
 *  是否为字母字符
 *
 *  @param
 *
 *  @return bool
 */
+(BOOL)judgeStrIsCharacter:(NSString*)str;
//获取拼音首字母(传入汉字字符串, 返回大写拼音首字母)
- (NSString *)firstCharactor:(NSString *)aString;
/**   函数名称 :replaceStringToString
 **   函数作用 :替换不需要的字符
 **   函数参数 :   needReplaceStr   ---需要替换的string
 replaceString    ---需要替换掉的特殊字符
 toReplaceString  ---替换成需要的字符
 **   函数返回值:替换后string
 **/
+(NSString *)replaceStringToString:(NSString *)needReplaceStr
                     replaceString:(NSString *)replaceString
                   toReplaceString:(NSString *)toReplaceString;


/**   函数名称 :replaceFirstAndEndSpace
 **   函数作用 :去除首尾空格
 **   函数参数 :   buf   ---需要替换的string
 **   函数返回值:去除首尾空格后的string
 **/
+(NSString *)trimString:(NSString *)buf;
/**   函数名称 :DataToUTF8String
 **   函数作用 :将data类型的数据,转成UTF8的数据
 **   函数参数 :   data   ---需要转化的data
 **   函数返回值:utf8格式string
 **/
+(NSString *)dataToUTF8String:(NSData *)data;


/**   函数名称 :toRadians
 **   函数作用 :角度转弧度
 **   函数参数 :  角度
 **   函数返回值:  弧度
 **/
//角度转弧度
+ (CGFloat)toRadians:(CGFloat)degree;
//弧度转角度
+ (CGFloat)toDegrees:(CGFloat)radian;


/**   函数名称 :stringIsValidEmail:
 **   函数作用 :检测邮箱是否合法
 **   函数参数 : 待检测的邮箱地址
 **   函数返回值:  YES 合法 NO 不合法
 **/
+ (BOOL)stringIsValidEmail:(NSString *)checkString;

/**   函数名称 :stringIsValidNumber:
 **   函数作用 :检测输入是否是数字
 **   函数参数 : 待检测的输入
 **   函数返回值:  YES 合法 NO 不合法
 **/
+ (BOOL)stringIsValidNumber:(NSString *)checkString;

/**   函数名称 :stringLengthWithEncodingGBK
 **   函数作用 :判断字符串长度，中文为2个字符
 **   函数参数 :
 **           string    ---待计算的string
 **   函数返回值:string长度
 **/
+(NSInteger)stringLengthWithEncodingGBK:(NSString *)string;
/**
 *  @author 玉伯, 15-05-28 14:05
 *
 *  TODO:校验手机号格式
 *
 *  @return
 *
 *  @since 1.0
 */
+ (BOOL)validateMobileStructure:(NSString *)phone;

/**
 校验身份证号
 */
+ (BOOL)validateIdentityCard:(NSString *)identityCard;

/**是否为空字符
 */
+ (BOOL)validateIsStrWtihStr:(NSString *)str;
//根据时间戳获取星期几
+ (NSString *)getWeekDayFordate:(NSString *)date;

/**
 获取视频缩略图
 */
+(UIImage *)getImage:(NSString *)videoURL;


/**
 TODO:获取视屏的长度
 
 */
+(CGFloat)getVedioSecond:(NSURL *)filePath;



/**
 *  是否为字母字符
 *
 *  @param
 *
 *  @return bool
 */
+(BOOL)PureLetters:(NSString*)str;

@end
