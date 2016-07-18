//
//  MKControllerRouter.h
//  MK
//
//  Created by 李和平 on 16/6/22.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ZCControllerRouter <NSObject>

/**
 *  启动应用
 *
 *  @return 视图
 */
-(UIWindow*) didFinishLaunchingWithOptions;

@end
