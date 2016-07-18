//
//  MKMatchPageFactory.m
//  MK
//
//  Created by 李和平 on 16/6/22.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCMatchPageFactory.h"
#import "ZCMatchPageHelper.h"

@interface ZCMatchPageFactory ()
{
    id<ZCMatchPage>                 mMatchPage;
}

@end

@implementation ZCMatchPageFactory

//返回服务对象
- (id<ZCMatchPage>)matchPage
{
    if (mMatchPage==nil) {
        mMatchPage = [[ZCMatchPageHelper alloc] init];
        
    }
    
    return mMatchPage;
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

static ZCMatchPageFactory* mHandle=nil;
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
