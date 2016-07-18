//
//  MKHttpUpload.h
//  MK
//
//  Created by 李和平 on 16/7/5.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZCServerProtocol.h"
#import "ZCCache.h"
#import "ZCUpload.h"
#import "ZCNetTask.h"

@protocol ZCHttpUpload <NSObject>


/**
 *  启动http上传线程
 *
 *  @param _task     http请求参数
 *  @param _file     上传任务参数
 *  @param _complete http请求完成回调
 *  @return nil
 */
- (id<ZCUDTask,ZCTaskModel>)startTask:(ZCHTTPTask*)_task WithFileData:(ZCFormFileData*)_file Complete:(void(^)(ZCHTTPTask*))_complete;

/**
 *  启动http上传线程
 *
 *  @param _task     http请求参数
 *  @param _file     上传任务参数
 *
 *  @return nil
 */
- (id<ZCUDTask,ZCTaskModel>)startTask:(ZCHTTPTask*)_task WithFileData:(ZCFormFileData*)_file;

/**
 *  启动http上传线程
 *
 *  @param _task     http请求参数
 *  @param _file     上传任务参数
 *  @param _complete http请求完成回调
 *  @return nil
 */
- (id<ZCUDTask,ZCTaskModel>)startTask:(ZCHTTPTask*)_task WithFileDatas:(NSMutableArray*)_files Complete:(void(^)(ZCHTTPTask*))_complete;

/**
 *  启动http上传线程
 *
 *  @param _task     http请求参数
 *  @param _file     上传任务参数
 *
 *  @return nil
 */
- (id<ZCUDTask,ZCTaskModel>)startTask:(ZCHTTPTask*)_task WithFileDatas:(NSMutableArray*)_files;

@end



@protocol MKHttpUploadCfg <NSObject>

//网络请求对象
@property(nonatomic,assign)id<ZCUpload>             mHttpObject;
//server配置对象
@property(nonatomic,assign)id<ZCServerProtocol>     mServerConfig;
//
@property(nonatomic,strong)id<ZCCache>              mCache;


@end

