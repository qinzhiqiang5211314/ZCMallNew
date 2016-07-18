//
//  MKServerCfg_88.m
//  MK
//
//  Created by 李和平 on 16/6/2.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCServerCfg.h"

#define HTTP_SERVER_PORT  @"/mrrck-web/"

@implementation ZCServerCfg
@synthesize mDevelopApiBaseUrl;
@synthesize mTestApiBaseUrl;
@synthesize mPreReleaseApiBaseUrl;
@synthesize mHotFixApiBaseUrl;

-(NSString*)mDevelopApiBaseUrl
{
    if (mDevelopApiBaseUrl==nil) {
        mDevelopApiBaseUrl=[NSString stringWithFormat:@"http://192.168.1.88:8080%@",HTTP_SERVER_PORT];
    }
    return mDevelopApiBaseUrl;
    
}

-(NSString*)mTestApiBaseUrl
{
    if (mTestApiBaseUrl==nil) {
        mTestApiBaseUrl= [NSString stringWithFormat:@"http://192.168.1.188:808%@",HTTP_SERVER_PORT];
    }
    return mTestApiBaseUrl;
    
}

-(NSString*)mPreReleaseApiBaseUrl
{
    if (mPreReleaseApiBaseUrl==nil) {
        mPreReleaseApiBaseUrl= [NSString stringWithFormat:@"http://192.168.1.20:8080%@",HTTP_SERVER_PORT];
    }
    return mPreReleaseApiBaseUrl;
}

-(NSString*)mHotFixApiBaseUrl
{
    if (mHotFixApiBaseUrl==nil) {
        mHotFixApiBaseUrl= [NSString stringWithFormat:@"http://api.mrrck.cn:8080%@",HTTP_SERVER_PORT];
    }
    return mHotFixApiBaseUrl;
    
}

@end
