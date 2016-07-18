//
//  MKIMServerCfg.m
//  MK
//
//  Created by 李和平 on 16/6/30.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCIMServerCfg.h"

@interface ZCIMServerCfg()
{
    
}

@end

@implementation ZCIMServerCfg
@synthesize mDevelopIp;
@synthesize mTestIP;
@synthesize mPreReleaseIP;
@synthesize mHotFixIp;

@synthesize mDevelopPort;
@synthesize mTestPort;
@synthesize mPreReleasePort;
@synthesize mHotFixPort;


@synthesize mDevelopDomain;
@synthesize mTestDomain;
@synthesize mPreReleaseDomain;
@synthesize mHotFixDomain;


@synthesize mDevelopResource;
@synthesize mTestResource;
@synthesize mPreReleaseResource;
@synthesize mHotFixResource;

-(NSString*) mDevelopResource
{
    return nil;
}

-(NSString*) mTestResource
{
    return nil;
}

-(NSString*) mPreReleaseResource
{
    return nil;
}

-(NSString*) mHotFixResource
{
    return nil;
}



-(NSString*) mDevelopDomain
{
    return @"chenchong-pc";
}

-(NSString*) mTestDomain
{
    return @"chenchong-pc";
}

-(NSString*) mPreReleaseDomain
{
    return @"chenchong-pc";
}

-(NSString*) mHotFixDomain
{
    return @"chat.mrrck.cn";
}



-(NSString*) mDevelopPort
{
    return @"5222";
}

-(NSString*) mTestPort
{
    return @"5222";
}

-(NSString*) mPreReleasePort
{
    return @"5222";
}

-(NSString*) mHotFixPort
{
    return @"5222";
}


-(NSString*) mDevelopIp
{
    return @"192.168.1.188";
}

-(NSString*) mTestIP
{
    return @"192.168.1.88";
}

-(NSString*) mPreReleaseIP
{
    return @"192.168.1.128";
}

-(NSString*) mHotFixIp
{
    return @"chat.mrrck.cn";
}

@end
