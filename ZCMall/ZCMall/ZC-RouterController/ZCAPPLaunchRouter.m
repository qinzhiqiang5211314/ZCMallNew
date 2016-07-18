//
//  MKAPPLaunchRouter.m
//  MK
//
//  Created by 李和平 on 16/6/22.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCAPPLaunchRouter.h"



//第一次启动
#define FIRST_LAUNCH_KEY @"first_launch_key"
//保存赛事欢迎页的信息
#define MATCH_Welcome_Pages_Of_Information @"MATCH_Welcome_Pages_Of_Information"


@implementation ZCAPPLaunchRouter

/**
 *  app是否首次启动
 *
 *  @return 【yes/no】对应【首次启动/不是首次启动】
 */
-(BOOL) appFirstLaunch
{
        return [[NSUserDefaults standardUserDefaults] boolForKey:FIRST_LAUNCH_KEY];
}

/**
 *  设置启动成功
 */
-(void) launched
{
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:FIRST_LAUNCH_KEY];
}

/**
 *  是否启动赛事页面
 *
 *  @return 【yes/no】对应【启动/不启动】
 */
-(BOOL) matchShow
{
    return YES;
    //启动赛事也
//    NSString *filename = [[[[MKCacheTool caches] fileCache] cachePath] stringByAppendingPathComponent:@"matchWelcomePageInfo.archive"];
//    if ([MKSandBox isFileExists:filename]){
//        //获取数据
//        NSData * theData =[NSData dataWithContentsOfFile:filename];
//        if (theData.length > 0) {
//            NSKeyedUnarchiver *unArchiver=[[NSKeyedUnarchiver alloc]initForReadingWithData:theData];
//            NSDictionary *dictionary_archive=[unArchiver decodeObjectForKey:MATCH_Welcome_Pages_Of_Information];
//            [unArchiver finishDecoding];
//            
//            if (dictionary_archive[@"match"] && dictionary_archive[@"match"][@"id"]){
//                return  YES;
//            }else{
//                return NO;
//            }
//            
//        }else{
//            return NO;
//        }
//    }else
    return NO;

}

/**
 *  获取app信息
 */
-(void) appInformGet
{
//    NSMutableData *theData=[NSMutableData data];
//    NSKeyedArchiver *archiver=[[NSKeyedArchiver alloc]initForWritingWithMutableData:theData];
//    [archiver encodeObject:arg  forKey:MATCH_Welcome_Pages_Of_Information];
//    [archiver finishEncoding];
//    [theData writeToFile:[[[[MKCacheTool caches] fileCache] cachePath] stringByAppendingPathComponent:@"matchWelcomePageInfo.archive"] atomically:YES];
}

@end
