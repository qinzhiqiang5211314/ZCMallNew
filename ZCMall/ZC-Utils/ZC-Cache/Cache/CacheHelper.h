//
//  CacheHelper.h
//  MK
//
//  Created by hgh on 16/6/11.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cache.h"

@interface CacheHelper : NSObject<Cache>
{
    
}
//缓存路径
@property(nonatomic,strong)NSString*            mCachePath;

@end
