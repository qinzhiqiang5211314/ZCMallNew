//
//  MKNet.h
//  MK
//
//  Created by hgh on 16/6/11.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZCCache.h"

@protocol ZCNet <NSObject>


/**
 *  取消网络请求
 */
-(void) cancel;


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
-(id)post:(NSString *)_url Body:(NSDictionary *)_body header:(NSDictionary *)_header success:(void(^)(id responseObject))_success failure:(void(^)(NSError *error))_failure;

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
-(id)get:(NSString *)_url Body:(NSDictionary *)_body header:(NSDictionary*)_header success:(void (^)(id))_success failure:(void (^)(NSError *))_failure;



@end


@protocol ZCNetCache <NSObject>

@property(nonatomic,assign)id<ZCCache>              mCache;

@end

