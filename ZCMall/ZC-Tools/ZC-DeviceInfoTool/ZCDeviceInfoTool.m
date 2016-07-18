//
//  MKDeviceInfoTool.m
//  MK
//
//  Created by 李诚 on 16/6/14.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCDeviceInfoTool.h"

@implementation ZCDeviceInfoTool
/*
 * 函数作用: 获取uuid
 * 函数参数:
 * 函数返回值: uuid
 */
+(NSString *)getUUID{
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"DeviceUUID"] length] > 30) {
        return [[NSUserDefaults standardUserDefaults] objectForKey:@"DeviceUUID"];
    }
    CFUUIDRef puuid = CFUUIDCreate( nil );
    CFStringRef uuidString = CFUUIDCreateString( nil, puuid );
    NSString * result = (NSString *)CFBridgingRelease(CFStringCreateCopy( NULL, uuidString));//同时将对象（内存）的管理权交给ARC
    CFRelease(puuid);
    CFRelease(uuidString);
   NSString *UUID  = [[result description] stringByReplacingOccurrencesOfString:@"-" withString:@""];
    [[NSUserDefaults standardUserDefaults] setObject:UUID forKey:@"DeviceUUID"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    return UUID;
}



/**
 *  @author MCMac
 *
 *  保存Devecetoken
 */

+(void)saveDevecetoken:(NSData *)token{
    NSString *deviceTokenString2 = [[[[token description] stringByReplacingOccurrencesOfString:@"<"withString:@""] stringByReplacingOccurrencesOfString:@">" withString:@""]stringByReplacingOccurrencesOfString:@" " withString:@""];
    [[NSUserDefaults standardUserDefaults] setObject:deviceTokenString2 forKey:@"deviceToken"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(NSString *)getDevecetoken{
    NSString  *token = [[NSUserDefaults standardUserDefaults] objectForKey:@"deviceToken"];
    return token.length > 30 ? token : @"";
}




@end
