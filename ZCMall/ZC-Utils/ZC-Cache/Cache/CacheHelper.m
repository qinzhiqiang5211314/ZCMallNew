//
//  CacheHelper.m
//  MK
//
//  Created by hgh on 16/6/11.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "CacheHelper.h"
#import "ZCSandBox.h"

@implementation CacheHelper
@synthesize mCachePath;

/**
 *  返回cache路径
 *
 *  @return 路径Nsstring*
 */
-(NSString*) cachePath
{
    return mCachePath;
}
/**
 *  清理cache
 *
 *  @return 【yes/no】对应【清理缓存成功/清理缓存失败失败】
 */
-(BOOL) cacheClear
{
    if (mCachePath==nil) {
        return YES;
    }
    
    //删除缓存
    return [ZCSandBox deleteFile:mCachePath];
}


@end
