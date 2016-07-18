//
//  MKNetTask.h
//  MK
//
//  Created by hgh on 16/6/11.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger , MKHttpRequestMethod) {
    MKHTTPREQUSTMETHOD_Get = 0,
    MKHTTPREQUSTMETHOD_Post
};

typedef NS_ENUM(NSInteger , MKHttpRequestSerializerType) {
    MKHttpRequestSerializerTypeJSON=0,
    MKHttpRequestSerializerTypeXML
};


@interface ZCHTTPTask : NSObject
{
    
}
//网络请求参数
@property (nonatomic, strong) NSMutableDictionary *     mbody;
//http请求头信息
@property (nonatomic, strong) NSMutableDictionary *     mheader;

//返回的错误信息
@property (nonatomic, strong, readonly) NSString*       mErrorString;
//http请求返回的结果
@property (nonatomic, strong, readonly) id              mResponse;
/// 请求的URL
@property(nonatomic,strong)NSString *                   mUrl;
/// 请求的方式
@property(nonatomic,assign)MKHttpRequestMethod           mRequestMethod;

#pragma mark - do it user it

/**
 *  设置http请求信息
 *
 *  @param json 请求json数据
 */
-(void) setResponseData:(id)json;

/**
 *  设置错误描述
 *
 *  @param error 错误描述
 */
-(void) setErrorStr:(NSString*)error;

/**
 *  HTTP报头默认参数
 *
 *  @return 默认投参数
 */
- (NSDictionary *)defaultHeader;

@end



@protocol ZCTaskModel <NSObject>


@property (nonatomic, assign) float                     mProgress;//进度条数值
@property (nonatomic, assign) BOOL                      mIsCompleted;//下载/上传是否完成
@property (nonatomic, strong) NSString *                mError;//下载/上传错误
@property (nonatomic, assign) long long                 mBytesProgress;//已经 下载/上传的大小
@property (nonatomic, assign) long long                 mBytesTotal;//下载/上传的总数据大小

@property (nonatomic, copy)void(^ProgressBlock)(float);//进度回调
@property (nonatomic, copy)void(^SuccedBlock)(void);//成功回调
@property (nonatomic, copy)void(^ErrorBlock)(NSError*);//失败回调

@property (nonatomic, strong)id                         mOperation;//下载/上传 任务线程

@end



typedef NS_ENUM(NSInteger , MKUDTaskState) {
    MKUPTASK_notStart=0, //未开始
    MKUPTASK_pause=1,//暂停
    MKUPTASK_ing =2, //进行中
    MKUPTASK_over //任务结束

};

/**
 *  http 上传参数
 *
 *  @param nonatomic <#nonatomic description#>
 *  @param assign    <#assign description#>
 *
 *  @return nil
 */
//图片格式=====
#define MKFormData_Type_PNG @"image/png"
#define MKFormData_Type_JPG @"image/jpeg"
#define MKFormData_Type_GIF @"image/gif"
//音频格式
#define MKFormData_Type_MP3 @"audio/mpeg"
//视频格式
#define MKFormData_Type_MP4 @"video/mpeg"

/**
 *  http 下载参数
 *
 *  @param nonatomic <#nonatomic description#>
 *  @param strong    <#strong description#>
 *
 *  @return nil
 */
@interface ZCFormFileData : NSObject

//mFileData 类型【NSData*/NSString*】对应【文件流/本地文件地址】；
@property (nonatomic, strong) id        mFileData;//待上文件或者文件流
@property (nonatomic, strong) NSString* mFileName;//文件名称
@property (nonatomic, strong) NSString *mFileType; //文件类型
@property (nonatomic, strong) NSString *mFormKey; //key值

@end






//============================================================
@interface ZCOutputFileData : NSObject

@property (nonatomic, strong) NSString* mFilePath;//文件保存地址
@property (nonatomic, strong) NSString* mFileName;//文件名称
@property (nonatomic, strong) NSString *mFileType; //文件类型
@property (nonatomic, strong) NSString *mFormKey; //key值

@property (nonatomic, assign) BOOL      mSupportoutBreakPoint;//是否支持断点续传 【yes/no】对应【支持断点续传/不支持断点续传】；

@end



/**
 *  网络上传下载接口
 */

@protocol ZCUDTask <NSObject>

//任务状态
@property(nonatomic,assign)MKUDTaskState                mTaskState;


/**
 *  //停止任务
 */
- (void)stop;

/**
 *  //暂停任务
 */
- (void)pause;

/**
 *  //继续任务
 */
- (void)resume;

/**
 *  //是否处于暂停状态
 */
- (void)restart;


@end










