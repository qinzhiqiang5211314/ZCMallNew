//
//  MKControllerRouterFactory.m
//  MK
//
//  Created by 李和平 on 16/6/22.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCControllerRouterFactory.h"
#import "ZCAPPLaunchRouter.h"

@interface ZCControllerRouterFactory ()
{
    id<ZCControllerRouter>                  mRouter;
}

@end

@implementation ZCControllerRouterFactory


//返回服务对象
- (id<ZCControllerRouter>)router
{
    if (mRouter==nil) {
        mRouter = [[ZCAPPLaunchRouter alloc] init];
        
    }
    
    return mRouter;
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

static ZCControllerRouterFactory* mHandle=nil;
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
