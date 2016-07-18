//
//  MKAPPLoginFactory.m
//  MK
//
//  Created by hgh on 16/6/20.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCAPPLoginFactory.h"
#import "ZCAPPLoginHelper.h"

@interface ZCAPPLoginFactory()
{
    id<ZCAPPLogin>                  mLogin;
}

@end

@implementation ZCAPPLoginFactory


//返回登录对象
-(id<ZCAPPLogin>)appLogin
{
    if (mLogin==nil) {
        mLogin = [[ZCAPPLoginHelper alloc] init];
    }
    
    return mLogin;
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

static ZCAPPLoginFactory* mHandle=nil;
+(ZCAPPLoginFactory*) shareDefault
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
