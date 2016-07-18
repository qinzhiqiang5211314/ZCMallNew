//
//  MKDownloadTask.h
//  MK
//
//  Created by hgh on 16/6/12.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZCNetTask.h"

@interface ZCDownloadTask : NSObject<ZCUDTask,ZCTaskModel>
{
    
}
@property (nonatomic, strong) NSString *                mDownLoadUrl;//下载地址
@property (nonatomic, strong) NSString *                mSavePath;//存放路径
@property (nonatomic, strong) NSString *                mFileName;//保存文件名
@property (nonatomic, strong) NSString *                mFileType;//保存文件名

///**
// *  开始上传任务
// *
// *  @return 上传线程
// */
//- (id)startTask;


@end
