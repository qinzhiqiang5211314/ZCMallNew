//
//  MKNaviBarTool.m
//  MK
//
//  Created by hgh on 16/6/15.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCNaviBarTool.h"
#import "ZCCustomNaviBarItem.h"

@interface ZCNaviBarTool ()
{
    id<ZCNaviBarItemProtocal>           mNavBarItemCreate;
}

@end

@implementation ZCNaviBarTool


-(id<ZCNaviBarItemProtocal>)navBar
{
    if (mNavBarItemCreate==nil) {
        mNavBarItemCreate = [[ZCCustomNaviBarItem alloc] init];
    }
    
    return mNavBarItemCreate;
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

static ZCNaviBarTool* mHandle=nil;
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


+(id<ZCNaviBarItemProtocal>)tools
{
   return [[ZCNaviBarTool shareDefault] navBar];
}

@end
