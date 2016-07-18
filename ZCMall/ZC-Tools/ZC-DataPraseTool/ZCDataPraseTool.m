//
//  MKDataPraseTool.m
//  MK
//
//  Created by 李和平 on 16/6/23.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCDataPraseTool.h"
#import "ZCDataPraseHelper.h"

@interface ZCDataPraseTool()
{
    id<ZCDataParse>                 mParse;
}

@end

@implementation ZCDataPraseTool


-(id<ZCDataParse>)mParse
{
    if (mParse==nil) {
        mParse = [[ZCDataPraseHelper alloc] init];
    }
    return mParse;
}

/**
 *  返回数据解析对象
 *
 *  @return 数据解析实例
 */
+(id<ZCDataParse>) dataPrase
{
    return [[ZCDataPraseTool shareDefault] mParse];
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

static ZCDataPraseTool* mHandle=nil;
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


@end
