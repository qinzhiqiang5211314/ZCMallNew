//
//  MKAFUpload.m
//  MK
//
//  Created by hgh on 16/6/12.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCAFUpload.h"
#import "AFNetworking.h"
#import "ZCNetTask.h"

@interface ZCAFUpload()
{
    AFHTTPRequestOperation *            mAfOperation;
}

@end

@implementation ZCAFUpload
@synthesize mTaskState;
@synthesize mCache;

/*  http上传
 *
 *  @param _url            上传地址
 *  @param _uploadFilePath 待上传文件 信息
 *  @param _body           body体
 *  @param _body           头
 *  @param _progress       上传进度
 *  @param _success        上传成功回调
 *  @param _failure        上传失败回调
 *
 *  @return 返回上传线程DownloadProgressBlock
 */
-(id)upload:(NSString*)_url UploadFile:(ZCFormFileData*)_uploadFile WithBody:(NSDictionary*)_body WithHeader:(NSDictionary*)_header UploadProgressBlock:(void(^)(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead))_progress success:(void (^)(id responseObject))_success failure:(void (^)(NSError *error))_failure
{
    NSMutableArray* _array = [[NSMutableArray alloc] init];
    [_array addObject:_uploadFile];
    return [self upload:_url UploadFiles:_array WithBody:_body WithHeader:_header UploadProgressBlock:_progress success:_success failure:_failure];
}

/*  http上传
 *
 *  @param _url            上传地址
 *  @param _uploadFiles 待上传文件 信息
 *  @param _body           body体
 *  @param _body           头
 *  @param _progress       上传进度
 *  @param _success        上传成功回调
 *  @param _failure        上传失败回调
 *
 *  @return 返回上传线程DownloadProgressBlock
 */
-(id)upload:(NSString*)_url UploadFiles:(NSMutableArray*)_uploadFiles WithBody:(NSDictionary*)_body WithHeader:(NSDictionary*)_header UploadProgressBlock:(void(^)(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead))_progress success:(void (^)(id responseObject))_success failure:(void (^)(NSError *error))_failure
{
    AFHTTPRequestSerializer *serializer = [AFHTTPRequestSerializer serializer];
    
    // 2. Create an `NSMutableURLRequest`.
    NSMutableURLRequest *request =
    [serializer multipartFormRequestWithMethod:@"POST" URLString:_url
                                    parameters:_body
                     constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
                         
                         NSInteger _count = [_uploadFiles count];
                                 for (NSInteger i=0; i<_count; i++) {
                                     ZCFormFileData* _uploadFile = [_uploadFiles objectAtIndex:i];
                                     if ([_uploadFile.mFileData isKindOfClass:[NSString class]]) {
                                         [formData appendPartWithFileURL:[NSURL fileURLWithPath:_uploadFile.mFileData] name:_uploadFile.mFormKey fileName:_uploadFile.mFileName mimeType:_uploadFile.mFileType error:nil];
                                     }else
                                     {
                                         [formData appendPartWithFileData:_uploadFile.mFileData name:_uploadFile.mFormKey fileName:_uploadFile.mFileName mimeType:_uploadFile.mFileType];
                                     }
                         
                                 }

                         
        }];
    
    // 3. Create and use `AFHTTPRequestOperationManager` to create an `AFHTTPRequestOperation` from the `NSMutableURLRequest` that we just created.
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    AFHTTPRequestOperation *operation =
    [manager HTTPRequestOperationWithRequest:request
                                     success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                         
                                         if (_success) {
                                             _success(responseObject);
                                         }
                                         
                                         NSLog(@"Success %@", responseObject);
                                     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                         
                                         if (_success) {
                                             _success(error);
                                         }
                                         
                                         NSLog(@"Failure %@", error.description);
                                     }];
    
    // 4. Set the progress block of the operation.
    [operation setUploadProgressBlock:^(NSUInteger __unused bytesWritten,
                                        long long totalBytesWritten,
                                        long long totalBytesExpectedToWrite) {

        if (_progress) {
            _progress(bytesWritten,totalBytesWritten,totalBytesExpectedToWrite);
        }

        
        NSLog(@"Wrote %lld/%lld", totalBytesWritten, totalBytesExpectedToWrite);
        
        NSLog(@"上传进度---Wrote %f", (float)totalBytesWritten/(float)totalBytesExpectedToWrite);
    }];
    
    NSMutableDictionary* _dic = (NSMutableDictionary*)_header;
    
    NSEnumerator * enumeratorKey = [_dic keyEnumerator];
    
    //快速枚举遍历所有KEY的值
    for (NSString *_object in enumeratorKey) {
        NSString* _value = [_dic objectForKey:_object];
        [request setValue:_value forHTTPHeaderField:_object];
    }

    
    // 5. Begin!
    [operation start];
    
    mAfOperation = operation;
    
    return operation;
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
