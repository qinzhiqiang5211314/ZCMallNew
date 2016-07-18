//
//  MCDBFactory.m
//  MEIKU
//
//  Created by hgh on 16/5/28.
//  Copyright © 2016年 Mrrck. All rights reserved.
//

#import "ZCDBFactory.h"
#import "ZCFMDB.h"

@interface ZCDBFactory()
{
    id<ZCDB>                mDBs;
}

@end

@implementation ZCDBFactory


//返回数据库
-(id<ZCDB>)mkdb
{
    if (mDBs==nil) {
        mDBs = [[ZCFMDB alloc] init];
    }
    
    return mDBs;
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

static ZCDBFactory* mHandle=nil;
+(ZCDBFactory*) shareDefault
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
