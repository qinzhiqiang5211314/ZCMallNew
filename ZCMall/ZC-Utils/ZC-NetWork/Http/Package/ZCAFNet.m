//
//  MKAFNet.m
//  MK
//
//  Created by hgh on 16/6/11.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCAFNet.h"
#import "AFNetworking.h"
#import "ZCNetCfgProtocol.h"

@interface ZCAFNet ()
{
    
}

@property(nonatomic,weak)id<ZCNetCfgProtocol>           mNetCfg;

@end

@implementation ZCAFNet
@synthesize mNetCfg;
@synthesize mCache;


-(id) init
{
    self = [super init];
    if (self) {
        
        if ([self conformsToProtocol:@protocol(ZCNetCfgProtocol)]) {
            self.mNetCfg = (id<ZCNetCfgProtocol>)self;
            
        } else {
            //
            
        }
    }
    return self;
}

/**
 *  取消网络请求
 */
-(void) cancel
{
    
}


/**
 *  post 请求
 *
 *  @param _url     请求网址
 *  @param _body    请求body参数
 *  @param _header  请求头参数
 *  @param _success 成功回调
 *  @param _failure 失败回调
 *
 *  @return 返回网络请求线程对象
 */
-(id)post:(NSString *)_url Body:(NSDictionary *)_body header:(NSDictionary *)_header success:(void(^)(id responseObject))_success failure:(void(^)(NSError *error))_failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //编码格式 默认utf8
    //    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding (kCFStringEncodingGB_18030_2000);
    //    manager.requestSerializer.stringEncoding = enc;

    if (self.mNetCfg!=nil) {
        manager.requestSerializer.timeoutInterval = self.mNetCfg.mTimeoutInterval;
//        if (self.mNetCfg.mRequestSerializerType==0) {
//            [manager setRequestSerializer:[AFHTTPRequestSerializer serializer]];
//        }
//        if (self.mNetCfg.mResponseSerializerType==0) {
//            manager.requestSerializer=[AFJSONRequestSerializer serializer];
//        }
    }
    
    // 发生请求
    return [manager POST:_url body:_body header:_header success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (_success) {
            
            _success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (_failure) {
            _failure(error);
        }
    }];
}

/**
 *  get请求
 *
 *  @param _url     请求网址
 *  @param _body    请求body参数
 *  @param _header  请求头参数
 *  @param _success 成功回调
 *  @param _failure 失败回调
 *
 *  @return 返回网络请求线程对象
 */
-(id)get:(NSString *)_url Body:(NSDictionary *)_body header:(NSDictionary*)_header success:(void (^)(id))_success failure:(void (^)(NSError *))_failure
{
    _url = [_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    //编码格式 默认utf8
//    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding (kCFStringEncodingGB_18030_2000);
//    manager.requestSerializer.stringEncoding = enc;
    
    if (self.mNetCfg!=nil) {
        [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
        manager.requestSerializer.timeoutInterval = self.mNetCfg.mTimeoutInterval;
        [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];

        if (self.mNetCfg.mRequestSerializerType==0) {
            [manager setRequestSerializer:[AFHTTPRequestSerializer serializer]];
        }
        if (self.mNetCfg.mResponseSerializerType==0) {
            manager.requestSerializer=[AFJSONRequestSerializer serializer];
        }
    }
    
    // 发生请求
    return [manager GET:_url parameters:_body header:_header success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (_success) {
            id rst = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
            _success(rst);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (_failure) {
            _failure(error);
        }
    }];

}



@end
