//
//  MKBaseServiceNet.m
//  MK
//
//  Created by ZWD on 16/6/28.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCBaseService.h"
#import "ZCHttpTool.h"
#import "ZCUserDataLogic.h"


@interface ZCBaseService()
{
    ZCAPIUser* _apiss;
}

@end


@implementation ZCBaseService

-(id)getDataWithParameter:(id)_it Succed:(void(^)(id))_succed Failed:(void(^)(NSString*))_error;
{
    ZCAPIUser* _api = [[ZCAPIUser alloc] init];
    NSString* _actsion =[_it objectForKey:MK_API_ACTION];
    NSString* _port = [_it objectForKey:MK_BUSINESS_ID];
    _api.mlogicReqMap = _actsion;
    
    [_it removeObjectForKey:MK_API_ACTION];
    [_it removeObjectForKey:MK_BUSINESS_ID];
    
    return [_api postRequest:_port WithParam:_it Succed:^(id arg) {
        
        if (_succed) {
            _succed(arg);
        }
        
    } Error:^(NSString *_it) {
        if (_error) {
            _error(_it);
        }
    }];
    
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

-(void)getDataWithParameter:(id)_it WithDataBuffs:(NSMutableArray*)_buffs Succed:(void(^)(id))_succed Failed:(void(^)(NSString*))_error
{
    ZCAPIUser* _api = [[ZCAPIUser alloc] init];
    NSString* _actsion =[_it objectForKey:MK_API_ACTION];
    NSString* _port = [_it objectForKey:MK_BUSINESS_ID];
    _api.mlogicReqMap = _actsion;
    _apiss = _api;
    
    [_it removeObjectForKey:MK_API_ACTION];
    [_it removeObjectForKey:MK_BUSINESS_ID];
    
     [_api postRequest:_port WithParam:_it WithFileForm:_buffs Succed:^(id arg) {
        
        if (_succed) {
            _succed(arg);
        }
        
    } Error:^(NSString *_it) {
        if (_error) {
            _error(_it);
        }
    }];

}


@end
