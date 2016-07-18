//
//  MKCommonTool.m
//  MK
//
//  Created by hgh on 16/6/13.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCCommonTool.h"
#import <AVFoundation/AVFoundation.h>
#import <CoreMedia/CoreMedia.h>
//#import "CoreMedia.framework.h"

@implementation ZCCommonTool

+(BOOL)judgeStrIsCharacter:(NSString*)str{
    
    for(int i = 0; i < str.length; i++){
        
        unichar c = [str characterAtIndex:i];
        
        if((c<'A'||c>'Z')&&(c<'a'||c>'z'))
            
            return NO;
    }
    return YES;
}


//获取拼音首字母(传入汉字字符串, 返回大写拼音首字母)
- (NSString *)firstCharactor:(NSString *)aString
{
    //转成了可变字符串
    NSMutableString *str = [NSMutableString stringWithString:aString];
    //先转换为带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformMandarinLatin,NO);
    //再转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformStripDiacritics,NO);
    //转化为大写拼音
    NSString *pinYin = [str capitalizedString];
    //获取并返回首字母
    return [pinYin substringToIndex:1];
}
/**
 *  函数作用 :替换不必要的字符
 */
+(NSString *)replaceStringToString:(NSString *)needReplaceStr
                     replaceString:(NSString *)replaceString
                   toReplaceString:(NSString *)toReplaceString
{
    NSString *string = [needReplaceStr stringByReplacingOccurrencesOfString:replaceString withString:toReplaceString];
    return string;
}

/**
 *  函数作用 :去除首尾空格
 *
 */
+ (NSString *)trimString:(NSString *)buf
{
    NSString *string = [[NSMutableString alloc] initWithString:buf];
    
    CFStringTrimWhitespace((__bridge CFMutableStringRef)string);
    
    return string;
}
//将data类型的数据,转成UTF8的数据
+(NSString *)dataToUTF8String:(NSData *)data
{
    NSString *buf = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    //NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    //NSString *buf = [[NSString alloc] initWithData:data encoding:enc];
    
    return buf;
}

//角度转弧度
+ (CGFloat)toRadians:(CGFloat)degree
{
    return degree / 180.0 * M_PI;
}
//弧度转角度
+ (CGFloat)toDegrees:(CGFloat)radian
{
    return radian / M_PI * 180.0;
}
/**
 *  验证是否是邮箱
 *
 *  @param checkString
 *
 *  @return
 */
+ (BOOL)stringIsValidEmail:(NSString *)checkString
{
    NSString *stricterFilterString = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", stricterFilterString];
    
    return [emailTest evaluateWithObject:checkString];
}

/**   函数名称 :stringIsValidNumber:
 **   函数作用 :检测输入是否是数字
 **   函数参数 : 待检测的输入
 **   函数返回值:  YES 合法 NO 不合法
 **/
+ (BOOL)stringIsValidNumber:(NSString *)checkString
{
    BOOL isInt = NO;
    BOOL isFloat = NO;
    
    NSScanner* scan = [NSScanner scannerWithString:checkString];
    int valInt;
    isInt = [scan scanInt:&valInt] && [scan isAtEnd];
    
    scan = [NSScanner scannerWithString:checkString];
    float valFloat;
    isFloat = [scan scanFloat:&valFloat] && [scan isAtEnd];
    
    return isInt || isFloat;
}
/**   函数名称 :stringLengthWithEncodingGBK
 **   函数作用 :判断字符串长度，中文为2个字符
 **   函数参数 :
 **           string    ---待计算的string
 **   函数返回值:string长度
 **/
+ (NSInteger)stringLengthWithEncodingGBK:(NSString *)string
{
    if ([string length] == 0)
    {
        return 0;
    }
    
    NSStringEncoding ec = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    return [string lengthOfBytesUsingEncoding:ec];
}
/**
 *  @author 玉伯, 15-05-28 14:05
 *
 *  TODO:校验手机号格式
 *
 *  @return
 *
 *  @since 1.0
 */
+ (BOOL)validateMobileStructure:(NSString *)phone{
    if ([[ZCCommonTool trim:phone] length] == 0) {
        return NO;
    }
    NSString *regx = @"^\\d{11}$"; // 11位数字就行
    //    NSString *regx = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";////手机号以13， 15，18开头，八个 \d 数字字符
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regx];
    BOOL isValid = [predicate evaluateWithObject:phone];
    return isValid;
}

/**
 TODO:trim空格
 
 @param sender
 
 @author 王尧
 @since 1.0
 */
+ (NSString *)trim:(NSString *)dirtyString{
    NSString *cleanString = [dirtyString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return cleanString;
}
/**
 *  校验身份证号
 *
 *  @param identityCard 身份证号
 *
 *  @return
 */
+ (BOOL)validateIdentityCard: (NSString *)identityCard
{
    BOOL flag;
    if (identityCard.length <= 0)
    {
        flag = NO;
        return flag;
    }
    
    NSString *regex2 = @"^(^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$)|(^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])((\\d{4})|\\d{3}[Xx])$)$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    flag = [identityCardPredicate evaluateWithObject:identityCard];
    
    //如果通过该验证，说明身份证格式正确，但准确性还需计算
    if(flag)
    {
        if(identityCard.length==18)
        {
            //将前17位加权因子保存在数组里
            NSArray * idCardWiArray = @[@"7", @"9", @"10", @"5", @"8", @"4", @"2", @"1", @"6", @"3", @"7", @"9", @"10", @"5", @"8", @"4", @"2"];
            
            //这是除以11后，可能产生的11位余数、验证码，也保存成数组
            NSArray * idCardYArray = @[@"1", @"0", @"10", @"9", @"8", @"7", @"6", @"5", @"4", @"3", @"2"];
            
            //用来保存前17位各自乖以加权因子后的总和
            
            NSInteger idCardWiSum = 0;
            for(int i = 0;i < 17;i++)
            {
                NSInteger subStrIndex = [[identityCard substringWithRange:NSMakeRange(i, 1)] integerValue];
                NSInteger idCardWiIndex = [[idCardWiArray objectAtIndex:i] integerValue];
                
                idCardWiSum+= subStrIndex * idCardWiIndex;
                
            }
            
            //计算出校验码所在数组的位置
            NSInteger idCardMod=idCardWiSum%11;
            
            //得到最后一位身份证号码
            NSString * idCardLast= [identityCard substringWithRange:NSMakeRange(17, 1)];
            
            //如果等于2，则说明校验码是10，身份证号码最后一位应该是X
            if(idCardMod==2)
            {
                if([idCardLast isEqualToString:@"X"]||[idCardLast isEqualToString:@"x"])
                {
                    return flag;
                }else
                {
                    flag =  NO;
                    return flag;
                }
            }else
            {
                //用计算出的验证码与最后一位身份证号码匹配，如果一致，说明通过，否则是无效的身份证号码
                if([idCardLast isEqualToString: [idCardYArray objectAtIndex:idCardMod]])
                {
                    return flag;
                }
                else
                {
                    flag =  NO;
                    return flag;
                }
            }
        }
        else
        {
            flag =  NO;
            return flag;
        }
    }
    else
    {
        return flag;
    }
}

/**
 *  是否为空字符
 *
 *  @param
 *
 *  @return bool
 */
+ (BOOL)validateIsStrWtihStr:(NSString *)str{
    if (str ==  nil || [str isKindOfClass:[NSNull class]] || [str isEqualToString:@""]) {
        return NO;
    }else{
        return YES;
    }
}
//根据时间戳获取星期几
+ (NSString *)getWeekDayFordate:(NSString *)date
{
    NSInteger dis = 7; //前后的天数
    NSDate *nowDate = [NSDate date];
    NSDate *theDate;
    if (dis != 0)
    {
        NSTimeInterval  oneDay = 24*60*60*1;  //1天的长度
        //        theDate = [nowDate initWithTimeIntervalSinceNow: +oneDay*dis ];
        //or
        theDate = [nowDate initWithTimeIntervalSinceNow:-oneDay * dis];
    }
    else
    {
        theDate = nowDate;
    }
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    [formatter setTimeZone:zone];
    
    NSDate* localeDate = [formatter dateFromString:date];
    
    NSString *datee = [NSString stringWithFormat:@"%ld", (long)[localeDate timeIntervalSince1970]];//参数
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[nowDate timeIntervalSince1970]];//今天
    NSString *theTime = [NSString stringWithFormat:@"%ld", (long)[theDate timeIntervalSince1970]];//范围
    NSString *weekStr;
    if ([datee integerValue] <= [timeSp integerValue] && [datee integerValue] >= [theTime integerValue]) {//前七天的范围
        NSTimeInterval inteval = [timeSp integerValue]-[datee integerValue];
        if (0 <= inteval && inteval <= 24*60*60) {//今天，直接显示时间
            weekStr = [date componentsSeparatedByString:@" "].lastObject;
        }else {//昨天-前7天
            NSArray *weekday = [NSArray arrayWithObjects:[NSNull null], @"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];//
            //            NSDate *newDate = [NSDate dateWithTimeIntervalSince1970:localeDate];
            NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
            NSDateComponents *components = [calendar components:NSWeekdayCalendarUnit fromDate:localeDate];
            weekStr = [weekday objectAtIndex:components.weekday];
            NSString *str = [date componentsSeparatedByString:@" "].lastObject;
            weekStr = [weekStr stringByAppendingString:str];
        }
    }else {//前7天之前，显示：年-月-日-时间
        weekStr = date;
    }
    
    return weekStr;
}


/**
 获取视频缩略图
 */
+(UIImage *)getImage:(NSString *)videoURL{
    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:[NSURL fileURLWithPath:videoURL] options:nil];
    AVAssetImageGenerator *gen = [[AVAssetImageGenerator alloc] initWithAsset:asset];
    gen.appliesPreferredTrackTransform = YES;
    CMTime time = CMTimeMakeWithSeconds(0.0, 600);
    NSError *error = nil;
    CMTime actualTime;
    CGImageRef image = [gen copyCGImageAtTime:time actualTime:&actualTime error:&error];
    UIImage *thumb = [[UIImage alloc] initWithCGImage:image];
    CGImageRelease(image);
    return thumb;
}


/**
 TODO:获取视屏的长度

 */
+(CGFloat)getVedioSecond:(NSURL *)filePath{
    
    NSDictionary *opts = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:NO]
                                                     forKey:AVURLAssetPreferPreciseDurationAndTimingKey];
    AVURLAsset *urlAsset = [AVURLAsset URLAssetWithURL:filePath options:opts];
    float second = 0;
    second = (float)urlAsset.duration.value/(float)urlAsset.duration.timescale;
    return second;
}



+(BOOL)PureLetters:(NSString*)str{
    
    for(int i=0;i<str.length;i++){
        
        unichar c=[str characterAtIndex:i];
        
        if((c<'A'||c>'Z')&&(c<'a'||c>'z'))
            
            return NO;
    }
    return YES;
    
}


@end
