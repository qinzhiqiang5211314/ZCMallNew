//
//  MKRequestLogicProtocol.h
//  MK
//
//  Created by 李和平 on 16/6/17.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZCGZIP.h"
#import "ZCEncryption.h"

@protocol ZCRequestLogicProtocol <NSObject>

//网址压缩
@property(nonatomic,strong)id<ZCGZIP>               mGZIP;
//加解密
@property(nonatomic,strong)id<ZCEncryption>         mEncryption;


/**
 *  post请求
 *
 *  @param _requestId 请求id
 *  @param _param    参数
 *  @param _response 返回数据
 *  @param _error    错误信息
 *
 *  @return 请求线程
 */
-(id) postRequest:(NSString*)_requestId WithParam:(NSDictionary*)_param Succed:(void(^)(id))_response Error:(void(^)(NSString*))_error;


/**
 *  post请求
 *
 *  @param _requestId 请求id
 *  @param _param    参数
 *  @param _buffs    上传图片视频流 对象为 MKFormFileData*
 *  @param _response 返回数据
 *  @param _error    错误信息
 *
 *  @return 请求线程
 */
-(id) postRequest:(NSString*)_requestId WithParam:(NSDictionary*)_param WithFileForm:(NSMutableArray*)_buffs Succed:(void(^)(id))_response Error:(void(^)(NSString*))_error;


@end
