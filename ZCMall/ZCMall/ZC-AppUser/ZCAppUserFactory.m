//
//  MKAppUserFactory.m
//  MK
//
//  Created by 李和平 on 16/6/21.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCAppUserFactory.h"
#import "ZCAppUserHelper.h"

@interface ZCAppUserFactory()
{
    id<ZCAppUser>                   mUser;
}

@end

@implementation ZCAppUserFactory


//返回登录对象
-(ZCAppUserModel<ZCAppUser>*)user
{
    if (mUser==nil) {
        mUser = [[ZCAppUserHelper alloc] init];
    }
    
    return mUser;
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

static ZCAppUserFactory* mHandle=nil;
+(ZCAppUserFactory*) shareDefault
{
    @synchronized(self){
        if (mHandle==nil) {
            //mHandle=[[[[self class] alloc]init ]autorelease];
            mHandle = [[super allocWithZone:NULL]init];
            //[mHandle initWithDbName:@"contacts"];
            
        }
    }
    
    return mHandle;
}



@end
