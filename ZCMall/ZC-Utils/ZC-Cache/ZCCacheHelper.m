//
//  MKCacheHelper.m
//  MK
//
//  Created by hgh on 16/6/11.
//  Copyright © 2016年 MCMac. All rights reserved.
//
#import "ZCCacheHelper.h"
#import "CacheHelper.h"
#import "ZCSandBox.h"

@interface ZCCacheHelper()
{
    id<Cache>               mDBCache;
    id<Cache>               mPictureCache;
    id<Cache>               mAudioCache;
    id<Cache>               mVideoCache;
    id<Cache>               mWebCache;
    id<Cache>               mFileCache;
    
}

@end


@implementation ZCCacheHelper

/**
 *  返回本地数据库缓存对象
 *
 *  @return 返回缓存对象
 */
-(id<Cache>) dbCache
{
    if (mDBCache==nil) {
        CacheHelper* _cachehelper = [[CacheHelper alloc] init];
        _cachehelper.mCachePath = [ZCSandBox libraryPthWithDir:@"MKDBCache/"];
        mDBCache = _cachehelper;
        
    }
    
    return mDBCache;
    
}

/**
 *  返回本地图片缓存对象
 *
 *  @return 返回缓存对象
 */
-(id<Cache>) pictureCache
{
    if (mPictureCache==nil) {
        CacheHelper* _cachehelper = [[CacheHelper alloc] init];
        _cachehelper.mCachePath = [ZCSandBox libraryPthWithDir:@"MKPicCache/"];
        mPictureCache = _cachehelper;
        
    }
    
    return mPictureCache;
}

/**
 *  返回本地音频文件缓存对象
 *
 *  @return 返回缓存对象
 */
-(id<Cache>) audioCache
{
    if (mAudioCache==nil) {
        CacheHelper* _cachehelper = [[CacheHelper alloc] init];
        _cachehelper.mCachePath = [ZCSandBox libraryPthWithDir:@"MKAudioCache/"];
        mAudioCache = _cachehelper;
        
    }
    
    return mAudioCache;
}

/**
 *  返回本地视频文件缓存对象
 *
 *  @return 返回缓存对象
 */
-(id<Cache>) videoCache
{
    if (mVideoCache==nil) {
        CacheHelper* _cachehelper = [[CacheHelper alloc] init];
        _cachehelper.mCachePath = [ZCSandBox libraryPthWithDir:@"MKVideoCache/"];
        mVideoCache = _cachehelper;

        
    }
    
    return mVideoCache;
}

/**
 *  返回本地网页请求缓存对象
 *
 *  @return 返回缓存对象
 */
-(id<Cache>) webCache
{
    if (mWebCache==nil) {
        CacheHelper* _cachehelper = [[CacheHelper alloc] init];
        _cachehelper.mCachePath = [ZCSandBox libraryPthWithDir:@"MKWebCache/"];
        mWebCache = _cachehelper;
        
    }
    
    return mWebCache;

}

/**
 *  返回文件缓存对象
 *
 *  @return 返回缓存对象
 */
-(id<Cache>) fileCache
{
    if (mFileCache==nil) {
        CacheHelper* _cachehelper = [[CacheHelper alloc] init];
        _cachehelper.mCachePath = [ZCSandBox libraryPthWithDir:@"MKFileCache/"];
        mFileCache = _cachehelper;
        
    }
    
    return mFileCache;
}

@end
