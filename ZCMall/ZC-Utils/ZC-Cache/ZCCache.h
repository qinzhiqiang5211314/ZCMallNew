//
//  MKCache.h
//  MK
//
//  Created by hgh on 16/6/11.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cache.h"

@protocol ZCCache <NSObject>

/**
 *  返回本地数据库缓存对象
 *
 *  @return 返回缓存对象
 */
-(id<Cache>) dbCache;

/**
 *  返回本地图片缓存对象
 *
 *  @return 返回缓存对象
 */
-(id<Cache>) pictureCache;

/**
 *  返回本地音频文件缓存对象
 *
 *  @return 返回缓存对象
 */
-(id<Cache>) audioCache;

/**
 *  返回本地视频文件缓存对象
 *
 *  @return 返回缓存对象
 */
-(id<Cache>) videoCache;

/**
 *  返回本地网页请求缓存对象
 *
 *  @return 返回缓存对象
 */
-(id<Cache>) webCache;

/**
 *  返回文件缓存对象
 *
 *  @return 返回缓存对象
 */
-(id<Cache>) fileCache;

@end
