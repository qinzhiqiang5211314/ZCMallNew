//
//  MKCacheTool.h
//  MK
//
//  Created by hgh on 16/6/12.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZCCache.h"

@interface ZCCacheTool : NSObject
{
    
}

/**
 *  返回缓存对象
 *
 *  @return 缓存实例
 */
+(id<ZCCache>)caches;


@end
