//
//  MKLocationServerTool.h
//  MK
//
//  Created by 李和平 on 16/6/24.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZCLocationServer.h"

@interface ZCLocationServerTool : NSObject
{
    
}

/**
 *  返回gps定位对象
 *
 *  @return 定位对象实例
 */
+(id<ZCLocationServer>) locationServer;

@end
