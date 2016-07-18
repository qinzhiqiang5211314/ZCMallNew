//
//  MKServerCfgProtocol.h
//  MK
//
//  Created by 李和平 on 16/6/2.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <Foundation/Foundation.h>

// 不同环境服务器配置   开发环境/测试环境/预发布环境/正式环境
typedef NS_ENUM(NSUInteger,ZCServerEnvironment) {
    MKServerEnvironment_Develop, //开发环境
    MKServerEnvironment_Test, //测试环境
    MKServerEnvironment_PreRelease, //预发布环境
    MKServerEnvironment_HotFix, //appstore 发布环境
};



@protocol ZCServerCfgProtocol <NSObject>

//开发环境
@property(nonatomic,strong,readonly)NSString*                   mDevelopApiBaseUrl;
//测试环境
@property(nonatomic,strong,readonly)NSString*                   mTestApiBaseUrl;
//预发布环境
@property(nonatomic,strong,readonly)NSString*                   mPreReleaseApiBaseUrl;
//正式环境
@property(nonatomic,strong,readonly)NSString*                   mHotFixApiBaseUrl;


@end


@protocol ZCIMServerCfgProtocol <NSObject>

//开发环境
@property(nonatomic,strong,readonly)NSString*                   mDevelopIp;
//测试环境
@property(nonatomic,strong,readonly)NSString*                   mTestIP;
//预发布环境
@property(nonatomic,strong,readonly)NSString*                   mPreReleaseIP;
//正式环境
@property(nonatomic,strong,readonly)NSString*                   mHotFixIp;

//开发环境
@property(nonatomic,strong,readonly)NSString*                   mDevelopPort;
//测试环境
@property(nonatomic,strong,readonly)NSString*                   mTestPort;
//预发布环境
@property(nonatomic,strong,readonly)NSString*                   mPreReleasePort;
//正式环境
@property(nonatomic,strong,readonly)NSString*                   mHotFixPort;

//开发环境
@property(nonatomic,strong,readonly)NSString*                   mDevelopDomain;
//测试环境
@property(nonatomic,strong,readonly)NSString*                   mTestDomain;
//预发布环境
@property(nonatomic,strong,readonly)NSString*                   mPreReleaseDomain;
//正式环境
@property(nonatomic,strong,readonly)NSString*                   mHotFixDomain;

//开发环境
@property(nonatomic,strong,readonly)NSString*                   mDevelopResource;
//测试环境
@property(nonatomic,strong,readonly)NSString*                   mTestResource;
//预发布环境
@property(nonatomic,strong,readonly)NSString*                   mPreReleaseResource;
//正式环境
@property(nonatomic,strong,readonly)NSString*                   mHotFixResource;


@end
