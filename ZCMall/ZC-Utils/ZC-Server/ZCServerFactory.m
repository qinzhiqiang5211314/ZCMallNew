//
//  MKServerFactory.m
//  MK
//
//  Created by 李和平 on 16/6/2.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCServerFactory.h"
#import "ZCServerCfg.h"

@interface ZCServerFactory()
{
    ZCServer<ZCServerProtocol>*                 mMKServer;
}

@property(nonatomic,assign)ZCServerEnvironment          mServerEnvironment;

@end

@implementation ZCServerFactory
@synthesize mServerEnvironment;

//设置服务器配置对象
- (void)setServer:(ZCServer<ZCServerProtocol>*)_mkServer;
{
    mMKServer = _mkServer;
}
//设置服务器环境
- (void)setServerEnvironment:(ZCServerEnvironment)_type
{
    mHandle.mServerEnvironment = _type;
    mMKServer.mServerEnvironmentType = _type;
}

//返回服务器环境
- (ZCServerEnvironment)serverEnvironment
{
    return mHandle.mServerEnvironment;
}

//返回服务对象
- (ZCServer<ZCServerProtocol>*)mkServerWithType:(ZCServerEnvironment)_type
{
    if (mMKServer==nil) {
        mMKServer = [[ZCServerCfg alloc] init];
        mMKServer.mServerEnvironmentType = _type;
    }
    
    return mMKServer;
}

//返回服务对象
- (ZCServer<ZCServerProtocol>*)mkServer
{
    if (mMKServer==nil) {
        mMKServer = [[ZCServerCfg alloc] init];
        mMKServer.mServerEnvironmentType = MKServerEnvironment_HotFix;
    }
    
    return mMKServer;
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

static ZCServerFactory* mHandle=nil;
+(instancetype) shareDefault
{
    @synchronized(self){
        if (mHandle==nil) {
            //mHandle=[[[[self class] alloc]init ]autorelease];
            mHandle = [[super allocWithZone:NULL]init];
            mHandle.mServerEnvironment = MKServerEnvironment_HotFix;
            //[mHandle initWithDbName:@"contacts"];
            
        }
    }
    
    return mHandle;
}




@end
