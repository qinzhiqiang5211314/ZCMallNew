//
//  MKUserDataLogic.m
//  MK
//
//  Created by 李和平 on 16/6/17.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCUserDataLogic.h"

@implementation ZCAPIUser
@synthesize mlogicReqMap;

-(void)setMlogicReqMap:(NSString *)mlogicReqMap_
{
    mlogicReqMap = mlogicReqMap_;
}


/**
 *  模块请求参数
 *
 *  @return 参数nsstring*
 */
-(NSString*) logicReqMapping
{
    if (mlogicReqMap!=nil) {
        return self.mlogicReqMap;
    }
    
    return @"appAPI/apiUser.action";
}


@end

