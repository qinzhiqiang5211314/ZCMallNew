//
//  MKBaseServiceNet.h
//  MK
//
//  Created by ZWD on 16/6/28.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZCNetTask.h"


#define   MK_API_ACTION  @"mk_api_action"
#define   MK_BUSINESS_ID  @"mk_business_id"


@interface ZCBaseService : NSObject
{
    
}


/**
 *  @author MCMac
 *
 *  底层通用的数据请求函数
 *
 *  @param _it     参数字典
 *  @param _succed 成功回调
 *  @param _error  失败回调
 */

-(id)getDataWithParameter:(id)_it Succed:(void(^)(id))_succed Failed:(void(^)(NSString*))_error;

/**
 *  @author MCMac
 *
 *  底层通用的数据请求函数
 *
 *  @param _it     参数字典
 *  @param _buffs  MKFormFileData*
 *  @param _succed 成功回调
 *  @param _error  失败回调
 */

-(void)getDataWithParameter:(id)_it WithDataBuffs:(NSMutableArray*)_buffs Succed:(void(^)(id))_succed Failed:(void(^)(NSString*))_error;


@end
