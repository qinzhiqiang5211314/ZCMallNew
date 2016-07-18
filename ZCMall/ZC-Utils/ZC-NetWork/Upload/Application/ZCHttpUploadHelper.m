//
//  MKHttpUploadHelper.m
//  MK
//
//  Created by 李和平 on 16/7/5.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCHttpUploadHelper.h"
#import "ZCNetCfg.h"
#import "ZCAFUpload.h"

@interface ZCHttpUploadHelper()
{
   
}

@end

@implementation ZCHttpUploadHelper
@synthesize mServerConfig;
@synthesize mHttpObject;
@synthesize mCache;
@synthesize mOperation;
@synthesize mError;
@synthesize mProgress;
@synthesize mBytesTotal;
@synthesize mTaskState;
@synthesize mBytesProgress;
@synthesize mIsCompleted;
@synthesize ProgressBlock;
@synthesize SuccedBlock;
@synthesize ErrorBlock;


-(id<ZCServerProtocol>)mServerConfig
{
    if (mServerConfig==nil) {
        mServerConfig = [[ZCNetCfg alloc] init];
    }
    
    return mServerConfig;
}

-(id<ZCUpload>)mHttpObject
{
    if (mHttpObject==nil) {
        mHttpObject = [[ZCAFUpload alloc] init];
    }
    return mHttpObject;
}



/**
 *  启动http上传线程
 *
 *  @param _task     http请求参数
 *  @param _file     上传任务参数
 *  @param _complete http请求完成回调
 *  @return nil
 */
- (id<ZCUDTask,ZCTaskModel>)startTask:(ZCHTTPTask*)_task WithFileData:(ZCFormFileData*)_file Complete:(void(^)(ZCHTTPTask*))_complete
{
    id<ZCNetCache> _httpcache = (id<ZCNetCache>)mHttpObject;
    _httpcache.mCache = self.mCache;
    
    //添加默认头
    [self addDefaultHeaders:_task];
    //添加域名
    [self updateDomain:_task];
    
    //
    __weak typeof(self) _weakself = self;
    self.mOperation = [self.mHttpObject upload:_task.mUrl UploadFile:_file  WithBody:_task.mbody WithHeader:_task.mheader UploadProgressBlock:^(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead) {
        _weakself.mProgress = totalBytesRead /totalBytesExpectedToRead;
        _weakself.mBytesTotal =totalBytesExpectedToRead;
        _weakself.mBytesProgress =totalBytesRead;
        
        if (_weakself.ProgressBlock) {
            _weakself.ProgressBlock(totalBytesRead /totalBytesExpectedToRead);
        }
    } success:^(id responseObject) {
        _weakself.mIsCompleted = YES;
        if (_weakself.SuccedBlock) {
            _weakself.SuccedBlock();
        }
        [_weakself handleRequestResult:_task result:responseObject];
        if (_complete) {
            _complete(_task);
        }
    } failure:^(NSError *error) {
        _weakself.mIsCompleted = NO;
        
        if (_weakself.ErrorBlock) {
            _weakself.ErrorBlock(error);
        }
        [_weakself handleRequestResult:_task result:error];
        if (_complete) {
            _complete(_task);
        }
        
    }];
   
    return (id<ZCUDTask,ZCTaskModel>)self;
}

/**
 *  启动http上传线程
 *
 *  @param _task     http请求参数
 *  @param _file     上传任务参数
 *
 *  @return nil
 */
- (id<ZCUDTask,ZCTaskModel>)startTask:(ZCHTTPTask*)_task WithFileData:(ZCFormFileData*)_file
{
    return [self startTask:_task WithFileData:_file Complete:nil];
}

/**
 *  启动http上传线程
 *
 *  @param _task     http请求参数
 *  @param _file     上传任务参数
 *  @param _complete http请求完成回调
 *  @return nil
 */
- (id<ZCUDTask,ZCTaskModel>)startTask:(ZCHTTPTask*)_task WithFileDatas:(NSMutableArray*)_files Complete:(void(^)(ZCHTTPTask*))_complete
{
    id<ZCNetCache> _httpcache = (id<ZCNetCache>)mHttpObject;
    _httpcache.mCache = self.mCache;
    
    //添加默认头
    [self addDefaultHeaders:_task];
    //添加域名
    [self updateDomain:_task];
    
    //
    __weak typeof(self) _weakself = self;
     self.mOperation =[self.mHttpObject upload:_task.mUrl UploadFiles:_files  WithBody:_task.mbody WithHeader:_task.mheader UploadProgressBlock:^(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead) {
        _weakself.mProgress = totalBytesRead /totalBytesExpectedToRead;
        _weakself.mBytesTotal =totalBytesExpectedToRead;
        _weakself.mBytesProgress =totalBytesRead;
        
        if (_weakself.ProgressBlock) {
            _weakself.ProgressBlock(totalBytesRead /totalBytesExpectedToRead);
        }
    } success:^(id responseObject) {
        _weakself.mIsCompleted = YES;
        if (_weakself.SuccedBlock) {
            _weakself.SuccedBlock();
        }
        [_weakself handleRequestResult:_task result:responseObject];
        if (_complete) {
            _complete(_task);
        }
    } failure:^(NSError *error) {
        _weakself.mIsCompleted = NO;
        
        if (_weakself.ErrorBlock) {
            _weakself.ErrorBlock(error);
        }
        [_weakself handleRequestResult:_task result:error];
        if (_complete) {
            _complete(_task);
        }
        
    }];
    
    return (id<ZCUDTask,ZCTaskModel>)self;
}

/**
 *  启动http上传线程
 *
 *  @param _task     http请求参数
 *  @param _file     上传任务参数
 *
 *  @return nil
 */
- (id<ZCUDTask,ZCTaskModel>)startTask:(ZCHTTPTask*)_task WithFileDatas:(NSMutableArray*)_files
{
    return [self startTask:_task WithFileDatas:_files Complete:nil];
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


/**
 *  //停止任务
 */
- (void)stop
{
    [self.mOperation stop];
    self.mTaskState = MKUPTASK_notStart;
}

/**
 *  //暂停任务
 */
- (void)pause
{
    [self.mOperation pause];
    self.mTaskState = MKUPTASK_pause;
    
}

/**
 *  //继续任务
 */
- (void)resume
{
    [self.mOperation resume];
    self.mTaskState = MKUPTASK_ing;
}

/**
 *  //是否处于暂停状态
 */
- (void)restart
{
    
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

@end
