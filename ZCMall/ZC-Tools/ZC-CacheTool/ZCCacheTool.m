//
//  MKCacheTool.m
//  MK
//
//  Created by hgh on 16/6/12.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCCacheTool.h"
#import "ZCCacheHelper.h"

@interface ZCCacheTool()
{
    id<ZCCache>                     mCaches;
}

@end

@implementation ZCCacheTool

+ (id)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mHandle=[super allocWithZone:zone];
    });
    return mHandle;
    
    //return [[self createInstance] init];
}

static ZCCacheTool* mHandle=nil;
+(instancetype) shareDefault
{
    @synchronized(self){
        if (mHandle==nil) {
            //mHandle=[[[[self class] alloc]init ]autorelease];
            mHandle = [[super allocWithZone:NULL]init];
        }
    }
    
    return mHandle;
}

-(id<ZCCache>)cacheGet
{
    if (mCaches==nil) {
        mCaches = [[ZCCacheHelper alloc] init];
    }
    return mCaches;
}


/**
 *  返回缓存对象
 *
 *  @return 缓存实例
 */
+(id<ZCCache>)caches
{
   return [[ZCCacheTool shareDefault] cacheGet];
}

@end
