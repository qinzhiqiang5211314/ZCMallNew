//
//  MKUploadTask.m
//  MK
//
//  Created by hgh on 16/6/12.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCUploadTask.h"
#import "ZCAFUpload.h"

@interface ZCUploadTask()
{
    id<ZCUpload>                mUpload;
}

@end

@implementation ZCUploadTask
@synthesize mTaskState;
@synthesize mUpLoadUrl;
@synthesize mLocalFileName;
@synthesize mFileType;


/**
 *  开始下载或上传任务
 *
 *  @return 上传或下载线程
 */
- (id)startTask
{
    //
    __weak typeof(self) _weakself = self;
    ZCAFUpload* _uploads = [[ZCAFUpload alloc] init];
    mUpload = _uploads;
    
//    return [_uploads upload:self.mUpLoadUrl UploadFile:self.mLocalFileName UploadProgressBlock:^(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead) {
//        
//        _weakself.mProgress = totalBytesRead /totalBytesExpectedToRead;
//        _weakself.mBytesTotal =totalBytesExpectedToRead;
//        _weakself.mBytesProgress =totalBytesRead;
//        
//        if (_weakself.ProgressBlock) {
//            _weakself.ProgressBlock(totalBytesRead /totalBytesExpectedToRead);
//        }
//    } success:^(id responseObject) {
//        _weakself.mIsCompleted = YES;
//        if (_weakself.SuccedBlock) {
//            _weakself.SuccedBlock();
//        }
//    } failure:^(NSError *error) {
//        _weakself.mIsCompleted = NO;
//        
//        if (_weakself.ErrorBlock) {
//            _weakself.ErrorBlock(error);
//        }
//    }];
    
    return nil;
    
}

/**
 *  //停止任务
 */
- (void)stop
{
    [(id<ZCUDTask>)mUpload stop];
    self.mTaskState = [(id<ZCUDTask>)mUpload mTaskState];
}

/**
 *  //暂停任务
 */
- (void)pause
{
    [(id<ZCUDTask>)mUpload pause];
    self.mTaskState = [(id<ZCUDTask>)mUpload mTaskState];
}

/**
 *  //继续任务
 */
- (void)resume
{
    [(id<ZCUDTask>)mUpload resume];
    self.mTaskState = [(id<ZCUDTask>)mUpload mTaskState];
}

/**
 *  //是否处于暂停状态
 */
- (void)restart
{
    
}


@end
