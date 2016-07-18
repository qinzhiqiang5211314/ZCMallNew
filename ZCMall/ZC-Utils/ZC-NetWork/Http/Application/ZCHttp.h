//
//  MKNetWork.h
//  MK
//
//  Created by hgh on 16/6/11.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZCNetTask.h"
#import "ZCNet.h"
#import "ZCServerProtocol.h"
#import "ZCCache.h"


@protocol ZCHttp <NSObject>

/**
 *  网络请求入口
 *
 *  @param _task     网络请求任务
 *  @param _complete 网络请求完成回调
 *
 *  @return 网络请求线程
 */
-(id) httpRequest:(ZCHTTPTask*)_task complete:(void(^)(ZCHTTPTask*))_complete;


@end


@protocol MKHttpCfg <NSObject>

//网络请求对象
@property(nonatomic,assign)id<ZCNet> mHttpObject;
//server配置对象
@property(nonatomic,assign)id<ZCServerProtocol>     mServerConfig;
//
@property(nonatomic,strong)id<ZCCache>              mCache;


@end

