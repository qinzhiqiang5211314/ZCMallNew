//
//  MKUploadTask.h
//  MK
//
//  Created by hgh on 16/6/12.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZCNetTask.h"

@interface ZCUploadTask : NSObject<ZCUDTask,ZCTaskModel>
{
    
}

@property (nonatomic, strong) NSString *                mUpLoadUrl;//上传网址
@property (nonatomic, strong) NSString *                mLocalFileName;//本地需上传的文件  文件名称
@property (nonatomic, strong) NSString *                mFileType;//上传文件类型

///**
// *  开始上传任务
// *
// *  @return 上传线程
// */
//- (id)startTask;
//

@end
