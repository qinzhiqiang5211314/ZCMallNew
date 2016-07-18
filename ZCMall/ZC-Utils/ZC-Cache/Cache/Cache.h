//
//  Cache.h
//  MK
//
//  Created by hgh on 16/6/11.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Cache <NSObject>

/**
 *  返回cache路径
 *
 *  @return 路径Nsstring*
 */
-(NSString*) cachePath;
/**
 *  清理cache
 *
 *  @return 【yes/no】对应【清理缓存成功/清理缓存失败失败】
 */
-(BOOL) cacheClear;

@end
