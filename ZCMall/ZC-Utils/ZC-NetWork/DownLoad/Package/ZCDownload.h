//
//  MKDownload.h
//  MK
//
//  Created by hgh on 16/6/12.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZCNetTask.h"

@protocol ZCDownload <NSObject>


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
-(id)download:(NSString*)_url SavePath:(NSString*)_savepath SaveFileName:(NSString*)_filename SaveFileType:(NSString*)_filetype SupportBreakPoint:(BOOL)_ye DownloadProgressBlock:(void(^)(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead))_progress success:(void (^)(id responseObject))_success failure:(void (^)(NSError *error))_failure;


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
-(id)download:(NSString*)_url OutputFile:(ZCOutputFileData*)_outputfile DownloadProgressBlock:(void(^)(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead))_progress success:(void (^)(id responseObject))_success failure:(void (^)(NSError *error))_failure;



@end

