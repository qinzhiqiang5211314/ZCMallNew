//
//  MKIMServer.m
//  MK
//
//  Created by 李和平 on 16/6/30.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCIMServer.h"
#import "ZCServerCfgProtocol.h"

@interface ZCIMServer()
{
    
}

@property(nonatomic,assign)id<ZCIMServerCfgProtocol>           mImServerCfg;

@end

@implementation ZCIMServer
@synthesize mIp;
@synthesize mDomain;
@synthesize mPort;
@synthesize mResource;

-(instancetype)init
{
    self = [super init];
    if (self) {
        if ([self conformsToProtocol:@protocol(ZCIMServerCfgProtocol)]) {
            self.mImServerCfg = (id<ZCIMServerCfgProtocol>)self;
            
        } else {
            //
            
        }
    }
    return self;
}

-(void) initParam
{
    switch (self.mServerEnvironmentType) {
        case MKServerEnvironment_Develop:
        {
            mIp = [self.mImServerCfg mDevelopIp];
            mPort = [self.mImServerCfg mDevelopPort];
            mDomain = [self.mImServerCfg mDevelopDomain];
            mResource = [self.mImServerCfg mDevelopResource];
        }
            break;
            
        case MKServerEnvironment_Test:
        {
            mIp = [self.mImServerCfg mTestIP];
            mPort = [self.mImServerCfg mTestPort];
            mDomain = [self.mImServerCfg mTestDomain];
            mResource = [self.mImServerCfg mTestResource];
            
        }
            break;
            
        case MKServerEnvironment_PreRelease:
        {
            mIp = [self.mImServerCfg mPreReleaseIP];
            mPort = [self.mImServerCfg mPreReleasePort];
            mDomain = [self.mImServerCfg mPreReleaseDomain];
            mResource = [self.mImServerCfg mPreReleaseResource];

        }
            break;
            
        case MKServerEnvironment_HotFix:
        {
            mIp = [self.mImServerCfg mHotFixIp];
            mPort = [self.mImServerCfg mHotFixPort];
            mDomain = [self.mImServerCfg mHotFixDomain];
            mResource = [self.mImServerCfg mHotFixResource];

        }
            break;
            
        default:
            break;
    }
    
}

-(NSString*)mIp{
    if (mIp==nil) {
        [self initParam];
    }
    return mIp;
}

-(NSString*) mDomain
{
    if (mDomain==nil) {
        [self initParam];
    }
    return mDomain;

}

-(NSString*)mPort
{
    if (mPort==nil) {
        [self initParam];
    }
    return mPort;

}

-(NSString*)mResource
{
    if (mResource==nil) {
        [self initParam];
    }
    return mResource;

}



@end
