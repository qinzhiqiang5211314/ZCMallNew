//
//  MKNetCfg.m
//  MK
//
//  Created by hgh on 16/6/11.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCNetCfg.h"

@implementation ZCNetCfg
@synthesize mTimeoutInterval;
@synthesize mResponseSerializerType;
@synthesize mRequestSerializerType;

-(NSInteger)mTimeoutInterval
{
    mTimeoutInterval = 5;
    return mTimeoutInterval;
}

-(NSInteger)mRequestSerializerType
{
    mRequestSerializerType = 0;
    return mRequestSerializerType;
}

-(NSInteger)mResponseSerializerType
{
    mResponseSerializerType = 0;
    return mResponseSerializerType;
}

@end
