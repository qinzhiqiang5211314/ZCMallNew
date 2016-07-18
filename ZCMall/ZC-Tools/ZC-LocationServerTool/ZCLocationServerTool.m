//
//  MKLocationServerTool.m
//  MK
//
//  Created by 李和平 on 16/6/24.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCLocationServerTool.h"
#import "ZCLocationDataHandler.h"

@interface ZCLocationServerTool ()
{
    
    id<ZCLocationServer>                mLocServer;
}

@end

@implementation ZCLocationServerTool

-(id<ZCLocationServer>)MLocServer
{
    if (mLocServer==nil) {
        mLocServer = [[ZCLocationDataHandler alloc] init];
    }
    
    return mLocServer;
}

/**
 *  返回gps定位对象
 *
 *  @return 定位对象实例
 */
+(id<ZCLocationServer>) locationServer
{
    return [[ZCLocationServerTool shareDefault] MLocServer];
}


+ (id)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mHandle=[super allocWithZone:zone];
    });
    return mHandle;
    
    //return [[self createInstance] init];
}

static ZCLocationServerTool* mHandle=nil;
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



@end
