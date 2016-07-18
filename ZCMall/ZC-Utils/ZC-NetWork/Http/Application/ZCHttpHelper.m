//
//  MKNetWorkHelper.m
//  MK
//
//  Created by hgh on 16/6/11.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCHttpHelper.h"
#import "ZCNet.h"
#import "ZCAFNet.h"
#import "ZCNetCfg.h"

@interface ZCHttpHelper()
{
    
}

@end

@implementation ZCHttpHelper
@synthesize mHttpObject;
@synthesize mServerConfig;
//@synthesize mGZIP;
//@synthesize mEncryption;
@synthesize mCache;

-(id<ZCServerProtocol>)mServerConfig
{
    if (mServerConfig==nil) {
        mServerConfig = [[ZCNetCfg alloc] init];
    }
    
    return mServerConfig;
}

-(id<ZCNet>)mHttpObject
{
    if (mHttpObject==nil) {
        mHttpObject = [[ZCNetCfg alloc] init];
    }
    return mHttpObject;
}

/**
 *  网络请求入口
 *
 *  @param _task     网络请求任务
 *  @param _complete 网络请求完成回调
 *
 *  @return 网络请求线程
 */
-(id) httpRequest:(ZCHTTPTask*)_task complete:(void(^)(ZCHTTPTask*))_complete{
    //判断类型
    __weak typeof(self) _weakself = self;
    
    id<ZCNetCache> _httpcache = (id<ZCNetCache>)mHttpObject;
    _httpcache.mCache = self.mCache;
    
    //添加默认头
    [self addDefaultHeaders:_task];
    //添加域名
    [self updateDomain:_task];
    
    if (_task.mRequestMethod==MKHTTPREQUSTMETHOD_Get) {
        
        
       return [[self mHttpObject] get:_task.mUrl Body:_task.mbody header:_task.mheader success:^(id responseObject)
        {
            if (_complete) {
                
                [_weakself handleRequestResult:_task result:responseObject];
                _complete(_task);
            }

        }
         
        failure:^(NSError * error)
        {
                            
            if (_complete) {
                
                [_weakself handleRequestResult:_task result:error];
                _complete(_task);
            }
        }];
        
    }
    
    return [[self mHttpObject] post:_task.mUrl Body:_task.mbody header:_task.mheader success:^(id responseObject) {
        
        if (_complete) {
            
            [_weakself handleRequestResult:_task result:responseObject];
            _complete(_task);
        }

        
    } failure:^(NSError *error) {
        
        if (_complete) {
            [_weakself handleRequestResult:_task result:error];
            _complete(_task);
        }

    }];
    
}

-(void)addDefaultHeaders:(ZCHTTPTask*)_task
{
    NSDictionary* _defaultHeader = [_task defaultHeader];
    if (_defaultHeader!=nil) {
        if (_task.mheader==nil) {
            _task.mheader = [[NSMutableDictionary alloc] init];
            NSInteger _count = [_defaultHeader count];
            for (NSInteger i=0; i<_count; i++) {
                NSString* _key = [[_defaultHeader allKeys] objectAtIndex:i];
                [_task.mheader setObject:[_defaultHeader objectForKey:_key] forKey:_key];
            }
        }
    }else
    {
        if (_task.mheader==nil) {
            _task.mheader = [[NSMutableDictionary alloc] init];
            
        }
        [_task.mheader setObject:@"application/json" forKey:@"contentType"];
    }
}

-(void)updateDomain:(ZCHTTPTask*)_task
{
    if ((self.mServerConfig!=nil)&&(self.mServerConfig.mApiBaseUrl!=nil)) {
        //解析是否含有http域名
        NSString *detailUrl = _task.mUrl;
        if ([detailUrl hasPrefix:@"http"]) {
            return ;
        }

        _task.mUrl = [NSString stringWithFormat:@"%@%@", self.mServerConfig.mApiBaseUrl, _task.mUrl];

    }
}


- (void)handleRequestResult:(ZCHTTPTask *)request result:(id)result {
    
    if ([self checkResult:result]) {
        
        //        NSHTTPURLResponse * resp=(NSHTTPURLResponse *)task.response;
        //        NSInteger code= resp.statusCode;
        //        NSLog(@"responseObject");
        
        [request setResponseData:result];
        
    }else{
        
//        NSError * error=(NSError *)result;
//        NSString * errStr=[error.userInfo objectForKey:@"NSLocalizedDescription"];
//        NSString * errURLKey=[error.userInfo objectForKey:@"NSErrorFailingURLKey"];
//        NSLog(@"%@",errStr);
//        NSLog(@"%@",errURLKey);
        
        [request setErrorStr:@"数据错误"];
        
    }
    
}

- (BOOL)checkResult:(id )request {
    
    if ([request isKindOfClass:[NSError class]]) {
        
        return NO;
        
    }else{
        
        //       return [self checkJson:request withValidator:nil];
        return YES;
        
    }
}


@end
