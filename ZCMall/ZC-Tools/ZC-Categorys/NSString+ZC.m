//
//  NSString+ZC.m
//  ZCMall
//
//  Created by hgh on 16/7/16.
//  Copyright © 2016年 FHHY. All rights reserved.
//

#import "NSString+ZC.h"
#import "POAPinyin.h"
#import "ZCCommonTool.h"

@implementation NSString (ZC)

- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attrs context:nil].size;
}

//获取拼音首字母(传入汉字字符串, 返回大写拼音首字母)
+ (NSString *)firstCharactor:(NSString *)aString
{
    //转成了可变字符串
    //    NSMutableString *str = [NSMutableString stringWithString:aString];
    //    //先转换为带声调的拼音
    //    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformMandarinLatin,NO);
    //    //再转换为不带声调的拼音
    //    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformStripDiacritics,NO);
    //    //转化为大写拼音
    //    NSString *pinYin = [str capitalizedString];
    //获取并返回首字母
    //    return [pinYin substringToIndex:1];\
    
    
    NSString *pingname = @"";//首字母
    
    if (aString.length > 0) {
        if ([[aString substringToIndex:1] integerValue]) {//数字
            pingname=@"#";
        }else{
            pingname = [POAPinyin convert:[aString substringToIndex:1]];
        }
    }else{
        pingname=@"#";
    }
    
    if (pingname.length > 0) {
        pingname = [[pingname substringToIndex:1] uppercaseString];//转成大写字母
    }
    
    if (![ZCCommonTool judgeStrIsCharacter:pingname]) {
        return @"#";
    }
    
    return pingname;
}

/**
 *  @Author licheng, 15-01-21 16:01:45
 *
 *  TODO:将字符串首尾的空格去除
 */
- (NSString *)stringByTrimmingInvalidCharacter {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}


@end
