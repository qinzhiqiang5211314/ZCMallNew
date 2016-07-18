//
//  MKHttpTool.m
//  MK
//
//  Created by hgh on 16/6/12.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCHttpTool.h"
#import "ZCHttpHelper.h"
#import "ZCAFNet.h"
#import "ZCHttpHelper.h"
#import "ZCEncryptionHelper.h"
#import "ZCServerCfg.h"
#import "ZCGZIPHelper.h"
#import "ZCEncryptionHelper.h"
#import "ZCCacheTool.h"
#import "ZCServerFactory.h"
#import "ZCHttpUploadHelper.h"
#import "ZCHttpDownloadHelper.h"
#import "ZCAFUpload.h"
#import "ZCAFDownload.h"
#import "ZCNetCfg.h"

@interface ZCHttpTool()
{
    id<ZCNet>               mHttpObject;
    id<ZCServerProtocol>    mServerConfig;
    id<ZCGZIP>              mGzip;
    id<ZCEncryption>        mEncryption;
    
    //
    id<ZCUpload>            mUpload;
    id<ZCDownload>          mDownload;
}

@end

@implementation ZCHttpTool


+ (id)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mHandle=[super allocWithZone:zone];
    });
    return mHandle;
    
    //return [[self createInstance] init];
}

static ZCHttpTool* mHandle=nil;
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


-(id<ZCNet>)httpObject
{
    if (mHttpObject==nil) {
        mHttpObject = [[ZCNetCfg alloc] init];
    }
    return mHttpObject;
}

-(id<ZCServerProtocol>)serverConfig
{
    if (mServerConfig==nil) {
        mServerConfig = [[ZCServerFactory shareDefault] mkServer];//[[MKServerCfg alloc] init];
    }
    return mServerConfig;
}


-(id<ZCGZIP>)gzip
{
    if (mGzip==nil) {
        mGzip = [[ZCGZIPHelper alloc] init];
    }
    return mGzip;
}

-(id<ZCEncryption>)encryption
{
    if (mEncryption==nil) {
        mEncryption = [[ZCEncryptionHelper alloc] init];
    }
    return mEncryption;
}


-(id<ZCUpload>)upload
{
    if (mUpload==nil) {
        mUpload = [[ZCAFUpload alloc] init];
    }
    
    return mUpload;
}

-(id<ZCDownload>)download
{
    if (mDownload==nil) {
        mDownload = [[ZCAFDownload alloc] init];
    }
    return mDownload;
}

+(id<ZCHttp>)httpRequest
{
    //
    ZCHttpHelper* _httphelper = [[ZCHttpHelper alloc] init];
    _httphelper.mHttpObject = [[ZCHttpTool shareDefault] httpObject];
    _httphelper.mServerConfig = [[ZCHttpTool shareDefault] serverConfig];
//    _httphelper.mGZIP = [[MKHttpTool shareDefault] gzip];
//    _httphelper.mEncryption = [[MKHttpTool shareDefault] encryption];
    _httphelper.mCache = [ZCCacheTool caches];
    return _httphelper;
    
}


/**
 *  返回下载对象
 *
 *  @return http下载请求实例
 */
+(id<ZCHttpDownload>)downloadTask
{
    ZCHttpDownloadHelper* _task = [[ZCHttpDownloadHelper alloc] init];
    _task.mHttpObject = [[ZCHttpTool shareDefault] download];
    _task.mServerConfig = [[ZCHttpTool shareDefault] serverConfig];
    //    _httphelper.mGZIP = [[MKHttpTool shareDefault] gzip];
    //    _httphelper.mEncryption = [[MKHttpTool shareDefault] encryption];
    _task.mCache = [ZCCacheTool caches];
    return _task;
}


/**
 *  返回上传对象
 *
 *  @return http上传实例
 */
+(id<ZCHttpUpload>)uploadTask
{
    ZCHttpUploadHelper* _task = [[ZCHttpUploadHelper alloc] init];
    _task.mHttpObject = [[ZCHttpTool shareDefault] upload];
    _task.mServerConfig = [[ZCHttpTool shareDefault] serverConfig];
    //    _httphelper.mGZIP = [[MKHttpTool shareDefault] gzip];
    //    _httphelper.mEncryption = [[MKHttpTool shareDefault] encryption];
    _task.mCache = [ZCCacheTool caches];

    return _task;
}



@end
