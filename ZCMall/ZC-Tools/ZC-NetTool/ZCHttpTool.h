//
//  MKHttpTool.h
//  MK
//
//  Created by hgh on 16/6/12.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZCHttp.h"
#import "ZCNetTask.h"
#import "ZCHttpDownload.h"
#import "ZCHttpUpload.h"

@interface ZCHttpTool : NSObject
{
    
}

/**
 *  返回生成http请求对象
 *
 *  @return 网络请求实例
 */
+(id<ZCHttp>)httpRequest;

/**
 *  返回下载对象
 *
 *  @return http下载请求实例
 */
+(id<ZCHttpDownload>)downloadTask;


/**
 *  返回上传对象
 *
 *  @return http上传实例
 */
+(id<ZCHttpUpload>)uploadTask;


@end
