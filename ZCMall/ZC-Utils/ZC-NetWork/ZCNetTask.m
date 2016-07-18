//
//  MKNetTask.m
//  MK
//
//  Created by hgh on 16/6/11.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCNetTask.h"

@implementation ZCHTTPTask

@synthesize mbody;
@synthesize mheader;
@synthesize mErrorString;
@synthesize mResponse;
@synthesize mUrl;
@synthesize mRequestMethod;



/**
 *  设置http请求信息
 *
 *  @param json 请求json数据
 */
-(void) setResponseData:(id)json
{
    mResponse = json;
}

/**
 *  设置错误描述
 *
 *  @param error 错误描述
 */
-(void) setErrorStr:(NSString*)error
{
    mErrorString = error;
}

/// 在HTTP报头添加的自定义参数
- (NSDictionary *)defaultHeader{
    
   
//    NSString *version = WDAPPVERSION;
//    
//    if ([[WDCLIGet createInstance] wdcliUsable] == YES)
//    {
//        return @{@"WDCLI":[[WDCLIGet createInstance]wdcli],@"WDRES":@"JSON",@"DEVICE":@"IOS",@"VERSION":version};
//        
//    }
//    else
//    {
//        return nil;
//    }
    
    return nil;
}


@end

@implementation ZCFormFileData
@synthesize mFileData;
@synthesize mFileName;
@synthesize mFileType;
@synthesize mFormKey;


@end

@implementation ZCOutputFileData

@synthesize mFilePath;
@synthesize mFileName;
@synthesize mFileType;
@synthesize mFormKey;
@synthesize mSupportoutBreakPoint;



@end

