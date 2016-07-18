//
//  MKDownloadTask.m
//  MK
//
//  Created by hgh on 16/6/12.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCDownloadTask.h"
#import "ZCAFDownload.h"


@interface ZCDownloadTask()
{
    id<ZCDownload>                mDownload;
}

@end

@implementation ZCDownloadTask
@synthesize mDownLoadUrl;
@synthesize mSavePath;
@synthesize mFileName;
@synthesize mFileType;
@synthesize mProgress;
@synthesize mIsCompleted;
@synthesize mError;
@synthesize mBytesProgress;
@synthesize mBytesTotal;
@synthesize ProgressBlock;
@synthesize SuccedBlock;
@synthesize ErrorBlock;
@synthesize mTaskState;



/**
 *  开始下载或上传任务
 *
 *  @return 上传或下载线程
 */
- (id)startTask
{
    //
    if (mDownload!=nil) {
        return mDownload;
    }
    __weak typeof(self) _weakself = self;
    ZCAFDownload* _download = [[ZCAFDownload alloc] init];
    mDownload = _download;
//    return [_download download:self.mDownLoadUrl SavePath:self.mSavePath SaveFileName:self.mFileName SaveFileType:self.mFileType DownloadProgressBlock:^(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead) {
//        
//        _weakself.mProgress = totalBytesRead /totalBytesExpectedToRead;
//        _weakself.mBytesTotal =totalBytesExpectedToRead;
//        _weakself.mBytesProgress =totalBytesRead;
//        
//        if (_weakself.ProgressBlock) {
//            _weakself.ProgressBlock(totalBytesRead /totalBytesExpectedToRead);
//        }
//
//        
//    } success:^(id responseObject) {
//        
//        _weakself.mIsCompleted = YES;
//        if (_weakself.SuccedBlock) {
//            _weakself.SuccedBlock();
//        }
//
//        
//    } failure:^(NSError *error) {
//        _weakself.mIsCompleted = NO;
//        
//        if (_weakself.ErrorBlock) {
//            _weakself.ErrorBlock(error);
//        }
//
//        
//    }];
    
    return nil;
    
}

/**
 *  //停止任务
 */
- (void)stop
{
    [(id<ZCUDTask>)mDownload stop];
    self.mTaskState = [(id<ZCUDTask>)mDownload mTaskState];
}

/**
 *  //暂停任务
 */
- (void)pause
{
    [(id<ZCUDTask>)mDownload pause];
    self.mTaskState = [(id<ZCUDTask>)mDownload mTaskState];
}

/**
 *  //继续任务
 */
- (void)resume
{
    [(id<ZCUDTask>)mDownload resume];
    self.mTaskState = [(id<ZCUDTask>)mDownload mTaskState];
}

/**
 *  //是否处于暂停状态
 */
- (void)restart
{
    
}


@end

