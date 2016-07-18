//
//  MKUpload.h
//  MK
//
//  Created by hgh on 16/6/12.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZCFormFileData;

@protocol ZCUpload <NSObject>

/*  http上传
*
*  @param _url            上传地址
*  @param _uploadFile 待上传文件 信息
*  @param _body           body体
*  @param _body           头
*  @param _progress       上传进度
*  @param _success        上传成功回调
*  @param _failure        上传失败回调
*
*  @return 返回上传线程DownloadProgressBlock
*/
-(id)upload:(NSString*)_url UploadFile:(ZCFormFileData*)_uploadFile WithBody:(NSDictionary*)_body WithHeader:(NSDictionary*)_header UploadProgressBlock:(void(^)(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead))_progress success:(void (^)(id responseObject))_success failure:(void (^)(NSError *error))_failure;



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
-(id)upload:(NSString*)_url UploadFiles:(NSMutableArray*)_uploadFiles WithBody:(NSDictionary*)_body WithHeader:(NSDictionary*)_header UploadProgressBlock:(void(^)(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead))_progress success:(void (^)(id responseObject))_success failure:(void (^)(NSError *error))_failure;


@end



