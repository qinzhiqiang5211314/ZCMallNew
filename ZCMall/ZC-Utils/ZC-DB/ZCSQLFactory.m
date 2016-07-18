//
//  MCSQLFactory.m
//  MEIKU
//
//  Created by hgh on 16/5/28.
//  Copyright © 2016年 Mrrck. All rights reserved.
//

#import "ZCSQLFactory.h"
#import "ZCSQLHelper.h"
#import "ZWSQLHelper.h"

@interface ZCSQLFactory()
{
    id<ZCSQL>                mDBs;
}

@end



@implementation ZCSQLFactory

//返回数据库
-(id<ZCSQL>)mcsql
{
    if (mDBs==nil) {
        mDBs = [[ZCSQLHelper alloc] init];
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

static ZCSQLFactory* mHandle=nil;
+(ZCSQLFactory*) shareDefault
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
