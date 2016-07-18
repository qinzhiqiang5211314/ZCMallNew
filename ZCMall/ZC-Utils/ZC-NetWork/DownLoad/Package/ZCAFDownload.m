//
//  MKAFDownload.m
//  MK
//
//  Created by hgh on 16/6/12.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCAFDownload.h"
#import "AFNetworking.h"

@interface ZCAFDownload()
{
    AFHTTPRequestOperation *            mAfOperation;
    
   
    
    unsigned long long      mDownloadedBytes;
}

@end

@implementation ZCAFDownload
@synthesize mTaskState;


/**
 *  http下载
 *
 *  @param _url      下载地址
 *  @param _savepath 文件保存地址
 *  @param _filename 保存的文件名
 *  @param _filetype 保存的文件类型
 *  @param _progress 下载进度
 *  @param _success  下载成功回调
 *  @param _failure  下载失败回调
 *
 *  @return 返回下载线程
 */
-(id)download:(NSString*)_url SavePath:(NSString*)_savepath SaveFileName:(NSString*)_filename SaveFileType:(NSString*)_filetype SupportBreakPoint:(BOOL)_ye DownloadProgressBlock:(void(^)(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead))_progress success:(void (^)(id responseObject))_success failure:(void (^)(NSError *error))_failure
{
    
    mTaskState = MKUPTASK_notStart;

    NSString *fileName = [NSString stringWithFormat:@"%@%@", _savepath, _filename];
    
    NSURL *url = [[NSURL alloc] initWithString:_url];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    
     mDownloadedBytes=0;
    if (_ye) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:_savepath]) {
            //获取已下载的文件长度
            mDownloadedBytes = [self fileSizeForPath:fileName];
            if (mDownloadedBytes > 0) {
                //            NSMutableURLRequest *mutableURLRequest = [request mutableCopy];
                //            NSString *requestRange = [NSString stringWithFormat:@"bytes=%llu-", downloadedBytes];
                //            [mutableURLRequest setValue:requestRange forHTTPHeaderField:@"Range"];
                //            request = mutableURLRequest;
                
                //增加头域 告知服务器 从 哪个字节之后开始下载（不了解头域的还是那句话百度），不支持头域的可以直接跳过
                [request addValue:[NSString stringWithFormat:@"bytes=%llu-",mDownloadedBytes] forHTTPHeaderField:@"Range"];
            }
        }

    }
    
    
    mAfOperation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    mAfOperation.inputStream   = [NSInputStream inputStreamWithURL:url];
    mAfOperation.outputStream  = [NSOutputStream outputStreamToFileAtPath:fileName append:NO];
    
    
    //下载进度控制
    
    [mAfOperation setDownloadProgressBlock:^(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead) {
    
//        float _progress_ = ((double)totalBytesRead +downloadedBytes)/ ((downloadedBytes)+totalBytesExpectedToRead);
        if (_progress) {
            _progress(bytesRead,totalBytesRead +mDownloadedBytes,totalBytesExpectedToRead+mDownloadedBytes);
        }
        
        
    }];
    
    
    //已完成下载
    [mAfOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        //        weakSelf._bytesTotal = [weakSelf formatByteCount:operation.response.expectedContentLength];
        //        weakSelf._isCompleted = YES;
        mTaskState = MKUPTASK_over;
        if (_success) {
            _success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        mTaskState = MKUPTASK_over;
        if (_failure) {
            _failure(error);
        }
    }];
    
    
    mTaskState = MKUPTASK_ing;
    
    [mAfOperation start];

    return mAfOperation;

}

/**
 *  http下载
 *
 *  @param _url      下载地址
 *  @param _outputfile 保存文件信息
 *  @param _progress 下载进度
 *  @param _success  下载成功回调
 *  @param _failure  下载失败回调
 *
 *  @return 返回下载线程
 */
-(id)download:(NSString*)_url OutputFile:(ZCOutputFileData*)_outputfile DownloadProgressBlock:(void(^)(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead))_progress success:(void (^)(id responseObject))_success failure:(void (^)(NSError *error))_failure
{
    return [self download:_url SavePath:_outputfile.mFilePath SaveFileName:_outputfile.mFileName SaveFileType:_outputfile.mFileType SupportBreakPoint:_outputfile.mSupportoutBreakPoint DownloadProgressBlock:_progress success:_success failure:_failure];
}

- (unsigned long long)fileSizeForPath:(NSString *)path {
    signed long long fileSize = 0;
    NSFileManager *fileManager = [NSFileManager new]; // default is not thread safe
    if ([fileManager fileExistsAtPath:path]) {
        NSError *error = nil;
        NSDictionary *fileDict = [fileManager attributesOfItemAtPath:path error:&error];
        if (!error && fileDict) {
            fileSize = [fileDict fileSize];
        }
    }
    return fileSize;
}

/**
 *  //停止任务
 */
- (void)stop
{
    if ((mTaskState!=MKUPTASK_over)||(mTaskState!=MKUPTASK_notStart)) {
        [mAfOperation cancel];
        
        mTaskState = MKUPTASK_over;

    }
    
}

/**
 *  //暂停任务
 */
- (void)pause
{
    if (mTaskState==MKUPTASK_ing) {
        [mAfOperation pause];
        mTaskState = MKUPTASK_pause;
    }
    
}

/**
 *  //继续任务
 */
- (void)resume
{
    if (mTaskState==MKUPTASK_pause) {
        [mAfOperation resume];
        mTaskState = MKUPTASK_ing;

    }
}

/**
 *  //是否处于暂停状态
 */
- (void)restart
{
    
}


@end
